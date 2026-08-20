def call(String playbookName, String inventory = 'localhost') {
    echo "Running Ansible Playbook: ${playbookName} on inventory: ${inventory}..."
    sh "ansible-playbook -i ${inventory} ${playbookName}"
}