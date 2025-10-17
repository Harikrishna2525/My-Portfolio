# Hari Krishna R - AWS Cloud Engineer Portfolio

A stunning, modern portfolio website built with Flutter Web showcasing my transition from Flutter development to AWS Cloud Engineering.

## 🚀 About Me

**Hari Krishna R**  
AWS Cloud Engineer | Flutter Developer (2 Years)

Passionate about cloud technologies and creating scalable solutions. Transitioning my expertise from mobile/web development to cloud infrastructure and serverless architectures.

## 💼 AWS Experience

### **Core Services**
- **EC2**: Server deployment, configuration, and management
- **S3**: Static website hosting, CDN integration with CloudFront
- **Lambda**: Serverless functions and API development
- **API Gateway**: RESTful API creation and management
- **DynamoDB**: NoSQL database design and optimization

### **Networking & Security**
- VPC configuration and management
- Security Groups and Network ACLs
- IAM policies and user management
- CORS configuration
- Load Balancers and Auto Scaling

### **DevOps & Tools**
- Nginx web server configuration
- Elastic IP management
- DuckDNS domain integration
- Windows Server administration

## 🎯 Featured AWS Projects

### 1. **Portfolio Website - EC2 Deployment**
- Deployed on AWS EC2 with Nginx
- Elastic IP for static addressing
- Custom domain via DuckDNS
- 🔗 [Live Demo](http://krishportfolio.duckdns.org/)

### 2. **Static Site Hosting with CDN**
- S3 bucket for static hosting
- CloudFront CDN integration
- Video storage and streaming
- 🔗 [Live Demo](http://krishbucker.s3-website.eu-north-1.amazonaws.com/)

### 3. **Serverless API**
- AWS Lambda functions
- API Gateway integration
- DynamoDB database
- CORS-enabled REST API

### 4. **Cloud Infrastructure**
- VPC architecture design
- IAM security policies
- Load Balancer configuration
- Auto Scaling implementation

## 🛠️ Technologies & Tools

**AWS Services**: EC2, S3, Lambda, API Gateway, DynamoDB, CloudFront, VPC, IAM, Load Balancers, Auto Scaling  
**Web Servers**: Nginx  
**Development**: Flutter, Dart  
**Tools**: Windows Server, DuckDNS, Git

## 📱 Running This Portfolio

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK

### Installation

```bash
# Clone the repository
git clone <repository-url>

# Navigate to project directory
cd my_portfolio

# Install dependencies
flutter pub get

# Run on web
flutter run -d chrome

# Build for production
flutter build web
```

### Deploy to Web

#### Manual Deployment

```bash
# Build the web version
flutter build web --release

# Deploy to Firebase Hosting
firebase deploy --only hosting
```

#### Automated CI/CD Deployment

This project uses **GitHub Actions** for automatic deployment to Firebase Hosting.

✅ **Every push to `main` or `master` branch automatically deploys!**

**Setup CI/CD:**
1. Follow instructions in [`CI_CD_SETUP.md`](./CI_CD_SETUP.md)
2. Add `FIREBASE_TOKEN` secret to GitHub repository
3. Push code and watch it auto-deploy! 🚀

**Live Site:** https://harikrish-portfolio.web.app

## 🎨 Features

✅ **Modern UI/UX**: Clean, professional design with Google Fonts (Poppins)  
✅ **Responsive Design**: Fully mobile-responsive layout  
✅ **Animated Elements**: Smooth animations and transitions  
✅ **Auto-Playing Carousel**: Technology showcase with AWS services  
✅ **SEO Optimized**: Proper meta tags and Open Graph integration  
✅ **Blue Theme**: Professional AWS-inspired color scheme  
✅ **Live Project Links**: Direct links to deployed AWS projects  
✅ **CI/CD Pipeline**: Automated deployment with GitHub Actions  
✅ **Firebase Hosting**: Fast, secure global CDN hosting

## 📧 Contact

Open to AWS Cloud Engineering opportunities!

---

**© 2025 Hari Krishna R. All rights reserved.**
