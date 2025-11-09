# 🔥 DevTinder - Developer Networking Platform

[![JavaScript](https://img.shields.io/badge/JavaScript-ES6+-f7df1e.svg)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![React](https://img.shields.io/badge/React-18.3.1-61dafb.svg)](https://reactjs.org/)
[![Node.js](https://img.shields.io/badge/Node.js-20.x-339933.svg)](https://nodejs.org/)
[![Express.js](https://img.shields.io/badge/Express.js-4.x-000000.svg)](https://expressjs.com/)
[![MongoDB](https://img.shields.io/badge/MongoDB-7.x-47A248.svg)](https://www.mongodb.com/)
[![Azure](https://img.shields.io/badge/Azure-Cloud-0078d4.svg)](https://azure.microsoft.com/en-us)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

DevTinder is a modern platform for developers to **connect, collaborate, and build together**.  
Whether you’re looking for teammates for a hackathon, contributors for your open-source project,  
or co-founders for your next startup idea — DevTinder makes it easy to find the right people.

### 🎬 Video Walkthrough  
See DevTinder in action!

🔇 *Note: The GitHub-hosted video below may be muted by default due to browser restrictions. Please unmute to hear the audio.*

📽️ Demo Video:  

https://github.com/user-attachments/assets/d84e24d1-8106-4456-a8fe-b8b9fdac8552

<p align="center">
  ▶️ Prefer YouTube? <a href="https://youtu.be/t_e-CtLxn_Q">Watch it here</a>
</p>

<p align="center">
  <strong>Swipe, match, and collaborate with developers. Find teammates for hackathons, side projects, and startups.</strong>
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#tech-stack">Tech Stack</a> •
  <a href="#quick-start">Quick Start</a> •
  <a href="#deployment">Deployment</a> •
  <a href="#contributing">Contributing</a>
</p>

---

## 🚀 Features

### 🎯 Core Features
- **Profile Creation**: Showcase your skills, tech stack, and project interests
- **Smart Matching**: Swipe through curated developer profiles
- **Real-time Chat**: Connect and collaborate with your matches
- **Connection Management**: Manage your network of developer connections
- **Fully Responsive**: Optimized for seamless experience on phones, tablets, and desktops

### 🔐 Authentication & Security
- Email/Password authentication
- Google OAuth integration
- JWT-based session management
- Secure file upload for profile pictures
- Rate limiting and CORS protection

### 💳 Premium Features
- Razorpay payment integration
- Premium user status
- Enhanced profile visibility
- Advanced matching algorithms

### 🎨 UI/UX
- Modern, responsive design with Tailwind CSS
- Mobile-first approach
- Smooth animations and transitions

## 🛠 Tech Stack

### Backend
- **Runtime**: Node.js 18+
- **Framework**: Express.js
- **Database**: MongoDB with Mongoose ODM
- **Authentication**: JWT + Passport.js (Google OAuth)
- **Real-time**: Socket.IO
- **Payments**: Razorpay
- **Email**: AWS SES
- **File Upload**: Multer
- **Security**: Helmet, CORS, Rate Limiting

### Frontend
- **Framework**: React 19 with Vite
- **State Management**: Redux Toolkit
- **Routing**: React Router DOM
- **Styling**: Tailwind CSS + DaisyUI
- **HTTP Client**: Axios
- **Image Processing**: React Easy Crop

### DevOps & Deployment
- **Containerization**: Docker
- **Orchestration**: Docker Compose
- **CI/CD**: GitHub Actions ready
- **Cloud**: Azure App Service compatible
- **Monitoring**: Morgan logging

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ and npm
- MongoDB Atlas account
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/devtinder.git
   cd devtinder
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Environment Setup**
   
   **Backend** (`apps/backend/.env`):
   ```env
   PORT=7777
   NODE_ENV=development
   DB_CONNECTION_SECRET=mongodb+srv://username:password@cluster.mongodb.net/devtinder
   JWT_SECRET=your-super-secret-jwt-key
   CORS_ORIGIN=http://localhost:5173
   
   # Google OAuth (optional)
   GOOGLE_CLIENT_ID=your-google-client-id
   GOOGLE_CLIENT_SECRET=your-google-client-secret
   
   # Razorpay (optional)
   RAZORPAY_KEY_ID=your-razorpay-key-id
   RAZORPAY_KEY_SECRET=your-razorpay-key-secret
   
   # AWS SES (optional)
   AWS_ACCESS_KEY_ID=your-aws-access-key
   AWS_SECRET_ACCESS_KEY=your-aws-secret-key
   ```
   
   **Frontend** (`apps/frontend/.env`):
   ```env
   VITE_API_BASE_URL=http://localhost:7777/api
   ```

4. **Start development servers**
   ```bash
   npm run dev
   ```

5. **Access the application**
   - Frontend: http://localhost:5173
   - Backend API: http://localhost:7777/api

## 📁 Project Structure

```
devtinder/
├── apps/
│   ├── backend/                 # Express.js API server
│   │   ├── src/
│   │   │   ├── app.js          # Main application file
│   │   │   ├── config/         # Database configuration
│   │   │   ├── middlewares/    # Custom middleware
│   │   │   ├── models/         # Mongoose models
│   │   │   ├── routes/         # API routes
│   │   │   └── utils/          # Utility functions
│   │   ├── uploads/            # File upload directory
│   │   ├── package.json
│   │   └── Dockerfile
│   │
│   └── frontend/               # React application
│       ├── src/
│       │   ├── Components/     # React components
│       │   ├── utils/          # Redux store & utilities
│       │   ├── App.jsx         # Main App component
│       │   └── main.jsx        # Application entry point
│       ├── public/
│       ├── package.json
│       └── Dockerfile
│
├── docker-compose.yml          # Multi-container setup
├── package.json               # Workspace configuration
└── README.md
```

## 🔌 API Endpoints

### Authentication
- `POST /api/signup` - User registration
- `POST /api/login` - User login
- `POST /api/logout` - User logout
- `GET /api/auth/google` - Google OAuth login

### Profile Management
- `GET /api/profile/view` - Get current user profile
- `PATCH /api/profile/edit` - Update profile
- `POST /api/upload` - Upload profile picture

### Connections
- `GET /api/feed` - Get user feed
- `POST /api/request/send/:status/:userId` - Send connection request
- `GET /api/user/requests/received` - Get received requests
- `GET /api/user/connections` - Get connections

### Real-time Features
- Socket.IO events for real-time chat
- Live connection status
- Instant messaging

## 🐳 Docker Development

Run the entire stack with Docker Compose:

```bash
# Build and start all services
docker-compose up --build

# Run in background
docker-compose up -d

# Stop services
docker-compose down
```

## 🚀 Deployment

### Azure App Service (Recommended)

**Option A: Two App Services**

1. **Backend Deployment**:
   - Create Node.js 18 App Service
   - Deploy `apps/backend` folder
   - Set startup command: `node src/app.js`
   - Configure environment variables

2. **Frontend Deployment**:
   - Build: `npm --prefix apps/frontend run build`
   - Deploy `apps/frontend/dist` to Static Web Apps
   - Set `VITE_API_BASE_URL` to backend URL

**Option B: Single App Service**
- Deploy backend as primary app
- Serve frontend static files from backend
- Configure routing for SPA

### Environment Variables for Production

**Backend**:
```env
NODE_ENV=production
PORT=80
DB_CONNECTION_SECRET=mongodb+srv://...
JWT_SECRET=strong-production-secret
CORS_ORIGIN=https://yourdomain.com
```

**Frontend**:
```env
VITE_API_BASE_URL=https://api.yourdomain.com/api
```

## 🧪 Development Scripts

```bash
# Install all dependencies
npm install

# Start development servers (backend + frontend)
npm run dev

# Start backend only
npm run dev:backend

# Start frontend only
npm run dev:frontend

# Build for production
npm run build

# Start production servers
npm start
```

## 🔧 Configuration

### Rate Limiting
- Default: 100 requests per 15 minutes
- Configurable via environment variables
- IP-based limiting

### File Upload
- Supported formats: JPEG, JPG, PNG, GIF
- Max file size: 5MB
- Automatic image optimization

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

### Development Guidelines
- Follow existing code style
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🎯 Roadmap

- [ ] Advanced matching algorithms
- [ ] Video chat integration
- [ ] Project collaboration workspace
- [ ] Skills assessment system
- [ ] Mobile app (React Native)
- [ ] Integration with GitHub/GitLab
- [ ] AI-powered recommendations

## 🙏 Acknowledgments

- Built with love by me, for developers
- Inspired by the need for better developer networking
- Thanks to all contributors and the open-source community

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/devtinder/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/devtinder/discussions)
- **Email**: aryanjstar3@gmail.com

---

<p align="center">
  Made with ❤️ by Aryan Jaiswal
</p>

<p align="center">
  <a href="https://github.com/yourusername/devtinder/stargazers">⭐ Star us on GitHub</a>
</p>
