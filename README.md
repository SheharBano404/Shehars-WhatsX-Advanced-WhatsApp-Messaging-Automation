# WhatsX - WhatsApp Bulk Messaging Platform

## 📱 Overview
WhatsX is a comprehensive WhatsApp bulk messaging platform that allows users to send personalized messages from their own WhatsApp account, manage templates, schedule campaigns, and track delivery through a modern, intuitive web interface.

## ✨ Features

### 🔐 **Authentication & Role Management**
- Secure JWT-based authentication with persistent login
- Role-based access control (Admin/User)
- Unified authentication page with login/register tabs
- Email verification with OTP
- Admin access request workflow with detailed form
- Automatic user creation upon admin approval

### 📧 **Messaging Capabilities**
- Send individual WhatsApp messages via WhatsApp Web automation
- Bulk messaging with CSV import and manual contact entry
- Template-based messaging with dynamic variables and usage tracking
- Message scheduling with date/time selection (runs every minute)
- Delivery acknowledgment (waits for WhatsApp ack before marking as sent)

### 📊 **Admin Features**
- Comprehensive user management (CRUD operations)
- Template creation and management with categories
- Message logs with filtering and search
- Dashboard statistics and analytics
- Admin request management (approve/reject)
- User role management

### ⏰ **Scheduling & Automation**
- Schedule messages for future delivery
- View and manage scheduled messages
- Automatic execution worker (every 60s) that sends through the active WhatsApp session
- If WhatsApp is disconnected at execution time, the job is retried later automatically

### 📋 **Template Management**
- Create reusable message templates
- Dynamic variable support
- Category-based organization
- Template usage tracking
- Hard delete functionality

### 🎨 **Modern UI/UX**
- Clean, professional design with Tailwind CSS
- Responsive layout for all devices
- Dark mode support
- Intuitive navigation and user experience
- Real-time notifications and feedback

## 🛠️ Tech Stack

### Backend
- **Node.js** (Express.js)
- **MongoDB + Mongoose**
- **JWT** auth, **bcryptjs** password hashing
- **whatsapp-web.js** for WhatsApp Web automation
- **qrcode / qrcode-terminal** for QR rendering
- **helmet**, **express-rate-limit**, **cors** for security
- **SendGrid** for email notifications
- **dotenv** for env configuration

### Frontend
- **React 18** + **Vite** + **React Router v6**
- **Tailwind CSS** with dark mode
- Centralized `apiClient` and global notification provider

## 📦 Installation

### Prerequisites
- Node.js (v16 or higher)
- MongoDB (local or MongoDB Atlas)
- SendGrid account for email notifications

### 1. Clone Repository
```bash
git clone <https://github.com/zaeemakhtar12/WhatsX-Advanced-WhatsApp-Messaging-Automation.git>
cd FYP2
```

### 2. Backend Setup
```bash
cd backend
npm install
```

Create `.env` file in backend directory:
```env
# Database
MONGO_URI=mongodb://localhost:27017/whatsx
# OR for MongoDB Atlas:
# MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/whatsx

# JWT
JWT_SECRET=your-super-secret-jwt-key-here

# SendGrid Configuration
SENDGRID_API_KEY=your-sendgrid-api-key
SENDGRID_SENDER=your-verified-sender@example.com

# Server / CORS
PORT=5000
NODE_ENV=development
# Comma-separated list of allowed frontend origins (e.g. Vite dev URL)
CLIENT_ORIGIN=http://localhost:5173
```

### 3. Frontend Setup
```bash
cd frontend
npm install
```

Create `.env` file in frontend directory:
```env
VITE_API_URL=http://localhost:5000/api
```

## 🚀 Running the Application

### Start Backend Server
```bash
cd backend
npm run dev  # Development with nodemon
# OR
npm start    # Production
```

### Start Frontend
```bash
cd frontend
npm run dev  # Vite development server
# OR
npm run build && npm run preview  # Production build
```

Access the application at: `http://localhost:5173` (Vite default port)

## 🔧 Configuration

### SendGrid Email Setup
1. Create a SendGrid account
2. Generate an API key
3. Verify your sender email address
4. Add credentials to backend `.env` file

### MongoDB Setup
- **Local MongoDB**: `mongodb://localhost:27017/whatsx`
- **MongoDB Atlas**: Use your connection string
- Ensure proper network access configuration

## 📚 API Documentation

### Authentication Endpoints
- `POST /api/register` - User registration with email verification
- `POST /api/login` - User login (supports role selection)
- `POST /api/verify-otp` - Email verification
- `POST /api/admin-request` - Request admin access
- `GET /api/profile` - Get user profile
- `PATCH /api/profile` - Update user profile

### Message Endpoints
- `POST /api/send` - Send single message
- `POST /api/bulk` - Send bulk messages
- `GET /api/messages` - Get message logs with filtering
- `DELETE /api/messages/:id` - Delete message

### WhatsApp Web Endpoints
- `POST /api/whatsapp/start-session` - Start session and get QR (image data URL)
- `GET /api/whatsapp/status` - Get session status (`not_connected` | `initializing` | `qr_ready` | `connected` | `auth_failed`)
- `POST /api/whatsapp/stop-session` - Stop session
- `POST /api/whatsapp/send` - Send WhatsApp message via active session

### Scheduled Message Endpoints
- `POST /api/scheduled-messages` - Create scheduled message
- `GET /api/scheduled-messages` - Get scheduled messages
- `PUT /api/scheduled-messages/:id` - Update scheduled message
- `DELETE /api/scheduled-messages/:id` - Delete scheduled message

### Template Endpoints
- `GET /api/templates` - Get templates
- `POST /api/templates` - Create template
- `PUT /api/templates/:id` - Update template
- `DELETE /api/templates/:id` - Delete template

### Admin Endpoints (Requires Admin Role)
- `GET /api/users` - Get all users
- `GET /api/users/stats` - Get user statistics
- `GET /api/admin-requests` - Get admin requests
- `POST /api/admin-requests/:id/approve` - Approve admin request
- `POST /api/admin-requests/:id/reject` - Reject admin request
- `PUT /api/users/:id/role` - Update user role
- `DELETE /api/users/:id` - Delete user

## 🏗️ Project Structure

```
FYP2/
├── backend/
│   ├── src/
│   │   ├── config/              # Configuration files
│   │   ├── controllers/         # Route controllers
│   │   │   ├── messageController.js
│   │   │   ├── userController.js
│   │   │   ├── templateController.js
│   │   │   └── scheduledMessageController.js
│   │   │   └── whatsappController.js
│   │   ├── middleware/          # Custom middleware
│   │   │   ├── authMiddleware.js
│   │   │   └── validation.js
│   │   ├── models/              # Database models
│   │   │   ├── messageModel.js
│   │   │   ├── userModel.js
│   │   │   ├── templateModel.js
│   │   │   ├── scheduledMessageModel.js
│   │   │   └── adminRequestModel.js
│   │   ├── routes/              # API routes
│   │   │   ├── messageRoutes.js
│   │   │   ├── userRoutes.js
│   │   │   ├── templateRoutes.js
│   │   │   └── scheduledMessageRoutes.js
│   │   │   └── whatsappRoutes.js
│   │   └── app.js               # Main application file
│   ├── package.json
│   └── .env
├── frontend/
│   ├── src/
│   │   ├── components/          # Reusable components
│   │   │   ├── LoginForm.jsx
│   │   │   ├── RegisterForm.jsx
│   │   │   ├── MessageLog.jsx
│   │   │   ├── TemplateManagement.jsx
│   │   │   ├── ScheduleMessage.jsx
│   │   │   └── UserList.jsx
│   │   ├── features/            # Feature-specific components
│   │   │   └── BulkMessage/
│   │   │       ├── BulkMessagePage.jsx
│   │   │       ├── ContactCSVUpload.jsx
│   │   │       └── ContactEntryForm.jsx
│   │   ├── pages/               # Page components
│   │   │   ├── Dashboard.jsx
│   │   │   ├── UnifiedAuthPage.jsx
│   │   │   ├── VerifyOtpPage.jsx
│   │   │   └── AdminRequestPage.jsx
│   │   ├── utils/               # Utility functions
│   │   │   ├── apiClient.js
│   │   │   └── auth.js
│   │   ├── api.js               # API functions
│   │   ├── App.jsx              # Main React component
│   │   └── index.jsx            # Entry point
│   ├── package.json
│   ├── vite.config.js           # Vite configuration
│   └── .env
└── README.md
```

## 🔒 Security Features

- JWT token authentication with persistent login
- Role-based access control (Admin/User)
- Input validation and sanitization
- Environment variable validation
- Secure error handling
- Password hashing with bcrypt
- Email verification system
- Admin request approval workflow

## 🎨 UI/UX Features

- **Modern Design**: Clean, professional interface using Tailwind CSS
- **Responsive Layout**: Works seamlessly on desktop, tablet, and mobile
- **Dark Mode**: Built-in dark mode support
- **Real-time Feedback**: Toast notifications for user actions
- **Intuitive Navigation**: Easy-to-use sidebar navigation
- **Loading States**: Proper loading indicators throughout the app
- **Error Handling**: User-friendly error messages and recovery

## 🔄 Recent Updates

### Authentication System
- ✅ Unified login/register page with tab navigation
- ✅ Role selection dropdown for admin/user login
- ✅ Email verification with OTP
- ✅ Persistent login (no logout on refresh)
- ✅ Admin request workflow with detailed form

### UI/UX Improvements
- ✅ Migrated from Create React App to Vite for faster development
- ✅ Implemented Tailwind CSS for modern styling
- ✅ Removed excessive animations and emojis for professional look
- ✅ Improved responsive design and accessibility
- ✅ Enhanced notification system

### Backend Enhancements
- ✅ Fixed route conflicts and authentication issues
- ✅ Implemented hard delete for all entities
- ✅ Enhanced admin request workflow
- ✅ Improved error handling and logging
- ✅ Added comprehensive API endpoints

### Feature Fixes
- ✅ Fixed bulk message sending and notifications
- ✅ Resolved scheduled message display issues
- ✅ Fixed template creation and management
- ✅ Enhanced message log with filtering and search
- ✅ Improved user management functionality

## 🐛 Troubleshooting

### Common Issues

1. **MongoDB Connection Error**
   ```bash
   # Check if MongoDB is running
   mongod --version
   
   # For MongoDB Atlas, ensure IP is whitelisted
   # Check connection string in .env
   ```

2. **Frontend Build Errors**
   ```bash
   # Clear cache and reinstall
   rm -rf node_modules package-lock.json
   npm install
   
   # Check Vite configuration
   npm run dev
   ```

3. **WhatsApp Web**
   - If QR shows as text, ensure `qrcode` is installed and backend restarted
   - If messages say sent but not delivered, reconnect WhatsApp and retry; we wait for ack
   - Windows PowerShell: use `;` to chain commands (not `&&`)
   - Ensure `backend/.wwebjs_auth` and `.wwebjs_cache` are not committed

4. **Authentication Issues**
   - Ensure JWT_SECRET is set in backend .env
   - Check token expiration settings
   - Verify email verification flow

5. **Email Notifications Not Working**
   - Verify SendGrid API key in .env
   - Check sender email verification
   - Ensure proper email templates

### Development Commands

```bash
# Backend
cd backend
npm run dev          # Development with nodemon
npm start            # Production start
npm test             # Run tests

# Frontend
cd frontend
npm run dev          # Vite development server
npm run build        # Production build
npm run preview      # Preview production build
```

## 📈 Future Enhancements

- [ ] WhatsApp API integration (Twilio/WhatsApp Business API)
- [ ] Message delivery status tracking
- [ ] Advanced analytics dashboard with charts
- [ ] Multi-language template support
- [ ] File attachment support
- [ ] API rate limiting and caching
- [ ] Webhook integration for real-time updates
- [ ] Export functionality for reports (PDF/Excel)
- [ ] Mobile app development
- [ ] Multi-tenant architecture

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For support and questions:
- Create an issue in the repository
- Check existing documentation
- Review troubleshooting section
- Contact: mzaeemakhtar12@gmail.com

---

**Built with ❤️ for efficient WhatsApp business communication**

*Last updated: December 2024* 
<!-- E2E CI/CD Pipeline Test Run -->
