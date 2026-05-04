<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login · Internship Platform</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background: linear-gradient(135deg, #EEF2F6 0%, #E6ECF3 40%, #F4F7FB 100%);
            background-size: 200% 200%;
            animation: gradientShift 20s ease infinite;
            min-height: 100vh;
            overflow-x: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #0F172A;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .blob {
            position: fixed;
            width: 500px;
            height: 500px;
            border-radius: 50%;
            filter: blur(70px);
            opacity: 0.25;                 /* slightly more visible */
            pointer-events: none;
            animation: floatBlob 18s infinite ease-in-out;
            z-index: 0;
        }

        .blob-1 {
            background: radial-gradient(circle, rgba(56,163,253,0.5) 0%, rgba(56,163,253,0) 70%);
            top: -150px;
            right: -100px;
        }

        .blob-2 {
            background: radial-gradient(circle, rgba(56,224,255,0.4) 0%, rgba(56,224,255,0) 70%);
            bottom: -150px;
            left: -100px;
            animation-delay: -9s;
        }

        .blob-3 {
            background: radial-gradient(circle, rgba(56,163,253,0.35) 0%, rgba(56,163,253,0) 70%);
            width: 350px;
            height: 350px;
            top: 40%;
            left: 55%;
            animation-delay: -14s;
        }

        @keyframes floatBlob {
            0%, 100% { transform: translate(0, 0) scale(1); }
            33% { transform: translate(35px, -25px) scale(1.05); }
            66% { transform: translate(-18px, 20px) scale(0.95); }
        }

        .login-container {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 440px;
            padding: 20px;
        }

        .logo-area {
            text-align: center;
            margin-bottom: 32px;
            cursor: pointer;
            transition: opacity 0.2s;
        }

        .logo-area:hover {
            opacity: 0.85;
        }

        .logo-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, #38A3FD, #1F7AD1);
            border-radius: 12px;
            margin-bottom: 16px;
            animation: float 4s ease-in-out infinite;
        }

        .logo-icon i {
            color: white;
            font-size: 20px;
        }

        .logo-text {
            font-size: 24px;
            font-weight: 700;
            color: #000000;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
        }

        .login-card {
            background: #ffffff;
            border-radius: 32px;
            padding: 36px 32px;
            border: 1px solid rgba(56, 163, 253, 0.15);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05), 0 2px 8px rgba(0,0,0,0.03);
        }

        .role-tabs {
            display: flex;
            border-bottom: 1px solid rgba(56, 163, 253, 0.15);
            margin-bottom: 28px;
            gap: 0;
        }

        .role-tab {
            flex: 1;
            text-align: center;
            padding: 12px 0;
            font-size: 14px;
            font-weight: 600;
            color: #64748b;
            background: none;
            border: none;
            border-bottom: 2px solid transparent;
            cursor: pointer;
            transition: all 0.2s;
        }

        .role-tab.active {
            color: #38A3FD;
            border-bottom-color: #38A3FD;
        }

        .role-tab:hover:not(.active) {
            color: #1F7AD1;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: #4B5563;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px;
            background: #F8FAFC;
            border: 1px solid rgba(56, 163, 253, 0.25);
            border-radius: 14px;
            color: #0F172A;
            font-size: 14px;
            transition: all 0.2s;
            font-family: 'Inter', sans-serif;
        }

        .form-group input:focus {
            outline: none;
            border-color: #38A3FD;
            box-shadow: 0 0 0 3px rgba(56, 163, 253, 0.1);
            background: #ffffff;
        }

        .form-group input::placeholder {
            color: #9CA3AF;
            font-size: 13px;
        }

        .btn-login {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #38A3FD, #1F7AD1);
            color: white;
            border: none;
            border-radius: 16px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s;
            letter-spacing: 0.3px;
            margin-top: 8px;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(56, 163, 253, 0.4);
        }

        .error-message {
            background: #FEF2F2;
            border: 1px solid #FECACA;
            border-radius: 12px;
            padding: 12px 16px;
            color: #B91C1C;
            font-size: 13px;
            margin-bottom: 20px;
            display: none;
            text-align: center;
        }

        .error-message.show {
            display: block;
            animation: shake 0.3s ease;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-3px); }
        }

        .register-link {
            text-align: center;
            margin-top: 24px;
            padding-top: 20px;
            border-top: 1px solid #E2E8F0;
            color: #64748b;
            font-size: 13px;
        }

        .register-link a {
            color: #38A3FD;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s;
        }

        .register-link a:hover {
            color: #1F7AD1;
            text-decoration: underline;
        }

        .toast {
            position: fixed;
            bottom: 24px;
            right: 24px;
            z-index: 200;
            background: #ffffff;
            border-left: 4px solid #38A3FD;
            border-radius: 12px;
            padding: 14px 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            animation: slideInToast 0.3s ease;
            font-size: 13px;
            color: #0F172A;
            font-weight: 500;
        }

        .toast.error {
            border-left-color: #EF4444;
        }

        @keyframes slideInToast {
            from { opacity: 0; transform: translateX(100px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @media (max-width: 480px) {
            .login-card {
                padding: 28px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>
    <div class="blob blob-3"></div>

    <div class="login-container">
        <div class="logo-area" onclick="goHome()" title="Go to Home">
            <div class="logo-icon">
                <i class="fas fa-briefcase"></i>
            </div>
            <div class="logo-text">Internship Platform</div>
        </div>

        <div class="login-card">
            <div class="role-tabs">
                <button class="role-tab active" onclick="switchRole('intern')" id="internTab">Intern</button>
                <button class="role-tab" onclick="switchRole('companyAdmin')" id="companyAdminTab">Company / Admin</button>
            </div>

            <div class="error-message" id="errorMessage">
                <i class="fas fa-exclamation-circle mr-2"></i>
                <span id="errorText"></span>
            </div>

            <div id="internForm">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" id="internEmail" placeholder="intern@univ-tebessa.dz" autocomplete="email">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" id="internPassword" placeholder="Must be at least 6 characters" autocomplete="current-password">
                </div>
                <button class="btn-login" onclick="handleInternLogin()">Login</button>
            </div>

            <div id="companyAdminForm" style="display: none;">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" id="companyAdminEmail" placeholder="company@example.com" autocomplete="email">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" id="companyAdminPassword" placeholder="Must be at least 6 characters" autocomplete="current-password">
                </div>
                <button class="btn-login" onclick="handleCompanyAdminLogin()">Login</button>
            </div>

            <div class="register-link">
                New to Internship Platform? 
                <a href="register.html">Register (Student / Company)</a>
            </div>
        </div>
    </div>

    <script>
        let currentRole = 'intern';

        function goHome() {
            window.location.href = 'homepage.html';
        }
        window.goHome = goHome;

        function showToast(message, type = 'success') {
            const existing = document.querySelector('.toast');
            if (existing) existing.remove();
            
            const toast = document.createElement('div');
            toast.className = `toast ${type}`;
            toast.innerHTML = `
                <i class="fas ${type === 'error' ? 'fa-times-circle' : 'fa-check-circle'} text-lg" style="color: ${type === 'error' ? '#EF4444' : '#38A3FD'};"></i>
                <span>${message}</span>
                <button onclick="this.parentElement.remove()" style="background:none;border:none;color:#9CA3AF;cursor:pointer;margin-left:8px;"><i class="fas fa-times"></i></button>
            `;
            document.body.appendChild(toast);
            setTimeout(() => toast.remove(), 3500);
        }

        function showError(message) {
            const errorEl = document.getElementById('errorMessage');
            const errorText = document.getElementById('errorText');
            errorText.textContent = message;
            errorEl.classList.add('show');
            setTimeout(() => errorEl.classList.remove('show'), 4000);
        }

        function hideError() {
            document.getElementById('errorMessage').classList.remove('show');
        }

        function switchRole(role) {
            currentRole = role;
            hideError();
            
            document.getElementById('internTab').classList.toggle('active', role === 'intern');
            document.getElementById('companyAdminTab').classList.toggle('active', role === 'companyAdmin');
            document.getElementById('internForm').style.display = role === 'intern' ? 'block' : 'none';
            document.getElementById('companyAdminForm').style.display = role === 'companyAdmin' ? 'block' : 'none';
        }
        window.switchRole = switchRole;

        function handleInternLogin() {
            const email = document.getElementById('internEmail').value.trim().toLowerCase();
            const password = document.getElementById('internPassword').value;
            
            hideError();
            
            if (!email || !password) {
                showError('Please enter both email and password.');
                return;
            }
            
            if (password.length < 6) {
                showError('Password must be at least 6 characters.');
                return;
            }
            
            let students = JSON.parse(localStorage.getItem('registeredStudents')) || [];
            let student = students.find(s => s.email === email && s.password === password);
            
            if (student) {
                localStorage.setItem('currentUser', JSON.stringify({
                    id: student.id,
                    role: 'student',
                    name: `${student.firstName} ${student.lastName}`,
                    email: student.email,
                    department: student.specialization || 'N/A',
                    studentId: student.id
                }));
                showToast(`Welcome back, ${student.firstName}!`);
                setTimeout(() => { window.location.href = 'intern.html'; }, 1000);
            } else {
                showError('Invalid email or password. Please try again.');
                document.getElementById('internPassword').value = '';
            }
        }

        function handleCompanyAdminLogin() {
            const email = document.getElementById('companyAdminEmail').value.trim().toLowerCase();
            const password = document.getElementById('companyAdminPassword').value;
            
            hideError();
            
            if (!email || !password) {
                showError('Please enter both email and password.');
                return;
            }
            
            if (password.length < 6) {
                showError('Password must be at least 6 characters.');
                return;
            }
            
            const admins = [
                { id: 'ADM-001', name: 'Dr. Karim Mansouri', email: 'admin@internshipconnect.com', password: 'admin123' },
                { id: 'SUPER-ADMIN', name: 'Lina Benali', email: 'super.admin@univ-tebessa.dz', password: 'pfe2024' }
            ];
            
            let adminMatch = admins.find(a => a.email === email && a.password === password);
            if (adminMatch) {
                localStorage.setItem('currentUser', JSON.stringify({
                    role: 'admin',
                    adminId: adminMatch.id,
                    name: adminMatch.name,
                    email: adminMatch.email
                }));
                showToast(`Welcome, ${adminMatch.name}!`);
                setTimeout(() => { window.location.href = 'admin.html'; }, 1000);
                return;
            }
            
            let companies = JSON.parse(localStorage.getItem('registeredCompanies')) || [];
            let company = companies.find(c => c.email === email && c.password === password);
            
            if (company) {
                localStorage.setItem('currentUser', JSON.stringify({
                    id: company.id,
                    role: 'company',
                    name: company.companyName,
                    email: company.email
                }));
                showToast(`Welcome, ${company.companyName}!`);
                setTimeout(() => { window.location.href = 'company.html'; }, 1000);
                return;
            }
            
            showError('Invalid email or password. Please try again.');
            document.getElementById('companyAdminPassword').value = '';
        }

        window.handleInternLogin = handleInternLogin;
        window.handleCompanyAdminLogin = handleCompanyAdminLogin;

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') {
                if (currentRole === 'intern') {
                    handleInternLogin();
                } else {
                    handleCompanyAdminLogin();
                }
            }
        });
    </script>
</body>
</html>
