# End-to-End CI/CD Pipeline Architecture

## 1. Flow Overview
1. **Developer Push**: Developer pushes code to GitHub (`main` or feature branch).
2. **CI Stage (GitHub Actions)**:
   - Triggers automatically on push.
   - Builds Docker image and runs security scanning (Trivy/Gitleaks).
   - Pushes image to GitHub Container Registry (ghcr.io) with Git SHA + branch tags.
3. **Staging Deployment**:
   - Automatically triggers staging deployment via Ansible playbook.
4. **Manual Approval Gate**:
   - Production deployment pauses and waits for manual review/approval in GitHub UI.
5. **Production Deployment & Rollback**:
   - Upon approval, runs production Ansible playbook with rolling updates and automated health checks. If health check fails, triggers automated rollback.