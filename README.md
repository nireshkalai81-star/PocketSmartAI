# PocketSmart AI 💰✨

> **AI-powered budget planning for everyday needs**

PocketSmart AI is a FastAPI-based web application that uses Google's Gemini AI to generate personalized, budget-conscious recommendations for **home interiors, parties/events, and jewelry**. Users can create an account, generate plans in Indian Rupees (₹), receive shopping/search links, and review previously generated recommendations.

---

## 📌 Overview

PocketSmart is designed to turn a user's budget and requirements into a practical, itemized spending plan.

### Core planners

| Planner | What it does |
|---|---|
| 🏠 **Home Budget Planner** | Creates an interior/home furnishing budget for lighting, fans, furniture, dining tables, and selected rooms. |
| 🎉 **Party Budget Planner** | Allocates a party budget across venue, catering, decoration, entertainment, and other requirements. |
| 💎 **Jewelry Budget Planner** | Recommends jewelry for an occasion and budget, with optional outfit-image analysis. |
| 🕘 **Recommendation History** | Stores generated recommendations in the current application session for later viewing. |

The application is built primarily for **India-focused recommendations and INR pricing**.

---

## ✨ Features

- 🤖 **Gemini-powered recommendations**
- 💰 Budget-aware item and category allocations
- 🇮🇳 India-focused product/service recommendations
- 🛍️ Generated shopping/search links for supported platforms
- 👗 Optional outfit-image analysis for jewelry planning
- 🔐 User registration and login
- 🎫 JWT-based authentication with HTTP-only cookies
- 🔒 Password hashing with bcrypt
- 🕐 Automatic session expiration and cleanup
- 📋 Recommendation history with detailed results
- 📱 Responsive web interface
- 🖨️ Print/save support for party budget plans
- ⚡ FastAPI backend with Jinja2 templates

---

## 🛠️ Tech Stack

### Backend
- **Python 3**
- **FastAPI**
- **Uvicorn**
- **Pydantic**
- **Jinja2**

### AI & Image Processing
- **Google Gemini API**
- `google-genai`
- **Pillow**

### Authentication & Security
- **JWT** using `python-jose`
- **bcrypt** using `passlib`
- HTTP-only authentication cookies
- Environment-based secrets using `python-dotenv`

### Frontend
- HTML5
- CSS3
- Vanilla JavaScript
- Jinja2 templates
- Font Awesome

---

## 📁 Project Structure

```text
PocketSmartAI/
├── app.py                         # FastAPI application and AI logic
├── requirements.txt               # Python dependencies
├── run.bat                        # Windows setup and launcher
├── .env                           # Local environment variables (DO NOT COMMIT)
│
├── static/
│   ├── css/
│   │   └── styles.css             # Application styling
│   └── uploads/                   # Uploaded outfit images
│
└── templates/
    ├── base.html                  # Shared layout/navigation
    ├── index.html                 # Landing page
    ├── login.html                 # Login page
    ├── register.html              # Registration page
    ├── dashboard.html             # User dashboard
    ├── home_planner.html           # Home budget planner
    ├── party_planner.html          # Party budget planner
    ├── jewelry_planner.html        # Jewelry planner
    └── history.html               # Recommendation history
```

---

## ⚙️ Requirements

Before running the project, install:

- **Python 3.10+** recommended
- A valid **Google Gemini API key**
- Windows users can use the included `run.bat`

Check Python:

```bash
python --version
```

---

## 🚀 Installation

### 1. Clone or extract the project

```bash
git clone <your-repository-url>
cd PocketSmartAI
```

If you received the project as a ZIP, extract it and open a terminal inside the `PocketSmartAI` folder.

### 2. Create a virtual environment

#### Windows

```bash
python -m venv venv
venv\Scripts\activate
```

#### macOS / Linux

```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

---

## 🔑 Environment Configuration

Create a `.env` file in the project root:

```env
GOOGLE_API_KEY=your_gemini_api_key
SECRET_KEY=your_long_random_secret
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30
```

The application also accepts `GEMINI_API_KEY` as an alternative to `GOOGLE_API_KEY`.

### ⚠️ Important security note

**Never commit your `.env` file or API keys to GitHub.**

The supplied project archive contains an `.env` file with credential-like values. Before publishing the project, replace/rotate those credentials and add `.env` to `.gitignore`.

Recommended `.gitignore`:

```gitignore
.env
venv/
__pycache__/
*.pyc
static/uploads/*
```

You can provide a safe template for collaborators as `.env.example`:

```env
GOOGLE_API_KEY=
SECRET_KEY=
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30
```

---

## ▶️ Running the Application

### Option 1 — Windows launcher

The project includes `run.bat`, which:

1. Creates a virtual environment if one does not exist
2. Activates the environment
3. Installs dependencies
4. Checks for `.env`
5. Starts the FastAPI application

Run:

```bat
run.bat
```

### Option 2 — Manual startup

```bash
python app.py
```

Or with Uvicorn:

```bash
uvicorn app:app --host 127.0.0.1 --port 8000 --reload
```

Then open:

```text
http://127.0.0.1:8000
```

FastAPI's interactive API documentation is available at:

```text
http://127.0.0.1:8000/docs
```

---

## 🧭 Application Flow

```text
                    ┌─────────────────────┐
                    │    PocketSmart AI    │
                    └──────────┬──────────┘
                               │
                     ┌─────────▼─────────┐
                     │ Register / Login  │
                     └─────────┬─────────┘
                               │
                     ┌─────────▼─────────┐
                     │     Dashboard     │
                     └─────────┬─────────┘
                               │
          ┌────────────────────┼────────────────────┐
          │                    │                    │
          ▼                    ▼                    ▼
   Home Planner         Party Planner       Jewelry Planner
          │                    │                    │
          └────────────────────┼────────────────────┘
                               │
                     ┌─────────▼─────────┐
                     │   Gemini AI       │
                     │ Recommendation    │
                     └─────────┬─────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
              ▼                ▼                ▼
       Budget Breakdown   Search Links     Suggestions
                               │
                     ┌─────────▼─────────┐
                     │ Recommendation    │
                     │     History       │
                     └───────────────────┘
```

---

## 🏠 Home Budget Planner

The home planner accepts:

- Total budget
- Number of lights
- Number of fans
- Number of furniture items
- Number of dining tables
- Living room requirement
- Kitchen requirement
- Bedroom requirement
- Additional requirements

The AI returns a structured plan containing categories, item descriptions, estimated prices, quantities, remaining budget, and additional suggestions.

Example request:

```json
{
  "total_budget": 75000,
  "num_lights": 6,
  "num_fans": 3,
  "num_furniture": 4,
  "num_dining_tables": 1,
  "has_living_room": true,
  "has_kitchen": true,
  "has_bedroom": true,
  "additional_requirements": "Modern minimalist style"
}
```

Endpoint:

```text
POST /home-budget
```

---

## 🎉 Party Budget Planner

The party planner supports:

- Total budget
- Party type
- Guest count
- Venue type
- Catering
- Decoration
- Entertainment
- Additional requirements

The response can include:

- Budget categories
- Itemized estimates
- Venue suggestions
- Shopping/search links
- Remaining budget
- Event tips

Endpoint:

```text
POST /party-budget
```

---

## 💎 Jewelry Budget Planner

The jewelry planner accepts:

- Total budget
- Occasion
- Style/material preferences
- Optional outfit image

When an outfit image is uploaded, Gemini can analyze visual characteristics such as:

- Colors
- Style
- Formality

It then generates jewelry recommendations with estimated INR prices and shopping/search links.

Endpoint:

```text
POST /jewelry-budget
```

---

## 🔐 Authentication

PocketSmart implements a lightweight authentication system.

### Registration

```text
POST /register
```

Creates a user account with:

- Username
- Email
- Password
- Optional full name

Passwords are hashed using bcrypt before being stored.

### Login

```text
POST /token
```

Authenticates the user and creates a JWT access token.

The token is also stored in an HTTP-only cookie for browser sessions.

### Logout

```text
POST /logout
```

Invalidates the current session/token and removes the authentication cookie.

---

## 📚 Recommendation History

Generated plans are associated with the logged-in user and can be accessed through:

```text
GET /recommendation-history
```

To retrieve one specific recommendation:

```text
GET /recommendation-details/{recommendation_id}
```

The dashboard displays recent activity, while the History page provides access to previously generated plans.

> **Current implementation note:** user accounts, active sessions, and recommendation history are stored in Python in-memory dictionaries. Data will be lost when the application process restarts.

---

## 🔌 API Endpoints

| Method | Endpoint | Purpose | Auth |
|---|---|---|---|
| `GET` | `/` | Landing page | No |
| `GET` | `/login` | Login page | No |
| `GET` | `/register` | Registration page | No |
| `POST` | `/register` | Create account | No |
| `POST` | `/token` | Authenticate user | No |
| `POST` | `/logout` | End session | Yes |
| `GET` | `/dashboard` | User dashboard | Yes |
| `GET` | `/home-planner` | Home planner UI | Yes |
| `POST` | `/home-budget` | Generate home plan | Yes |
| `GET` | `/party-planner` | Party planner UI | Yes |
| `POST` | `/party-budget` | Generate party plan | Yes |
| `GET` | `/jewelry-planner` | Jewelry planner UI | Yes |
| `POST` | `/jewelry-budget` | Generate jewelry plan | Yes |
| `GET` | `/history` | History UI | Yes |
| `GET` | `/recommendation-history` | Get saved plans | Yes |
| `GET` | `/recommendation-details/{id}` | Get plan details | Yes |
| `GET` | `/session-info` | Get current session info | Yes |
| `GET` | `/docs` | Swagger/OpenAPI docs | No |

---

## 🧠 AI Response Processing

The backend asks Gemini to return structured JSON. PocketSmart then:

1. Sends user requirements and budget to Gemini.
2. Parses the AI response as JSON.
3. Adds shopping/search links based on generated search terms.
4. Calculates category-level budget information where applicable.
5. Returns the structured result to the browser.
6. Saves the generated recommendation to the user's in-memory history.

This design keeps the frontend simple while allowing the AI recommendation logic to remain centralized in `app.py`.

---

## 🛍️ Shopping/Search Links

Depending on the planner and category, generated recommendations may include links for platforms such as:

- Amazon
- Flipkart
- IKEA
- Myntra
- AJIO
- Meesho
- BigBasket
- Swiggy
- Zomato
- BookMyShow
- Google Search
- Booking.com
- MakeMyTrip
- OYO
- NoBroker
- Tanishq
- CaratLane
- BlueStone
- Melorra

These are **search links generated from AI-provided search terms**, not guaranteed product listings or live price feeds.

---

## 🖼️ Image Uploads

Jewelry planning supports optional image uploads.

Uploaded files are stored under:

```text
static/uploads/
```

The backend uses Pillow to open the image before sending it to the Gemini model for multimodal analysis.

For production deployment, consider adding:

- File-size limits
- MIME/type validation
- Image dimension limits
- Secure random filenames
- Automatic cleanup/retention policies
- Storage outside the public static directory

---

## 🔒 Security Considerations

This project is suitable as a prototype/demo, but production deployment should strengthen several areas.

### Current considerations

- User data is stored in memory.
- `SECRET_KEY` has a development fallback in code.
- CORS currently allows all origins.
- Uploaded files are stored in a publicly mounted static directory.
- There is no persistent database.
- The application does not implement rate limiting.
- AI-generated prices and recommendations should be treated as estimates.
- Search links do not guarantee availability, price, or product quality.

### Recommended production improvements

- Use PostgreSQL/MySQL or another persistent database.
- Store secrets only in a secure environment/secret manager.
- Set a strong production `SECRET_KEY`.
- Restrict CORS to trusted domains.
- Add CSRF protection where appropriate.
- Add request rate limiting.
- Validate and sanitize uploaded files.
- Use secure/random upload filenames.
- Add structured application logging.
- Add HTTPS.
- Add database-backed session/token management.
- Add automated tests and CI/CD.
- Add monitoring and error tracking.

---

## 🧪 Testing

The current project does not include a dedicated automated test suite.

A recommended future structure is:

```text
tests/
├── test_auth.py
├── test_home_planner.py
├── test_party_planner.py
├── test_jewelry_planner.py
└── test_history.py
```

Useful test areas include:

- User registration
- Duplicate usernames
- Login/logout
- Invalid credentials
- JWT expiration
- Protected routes
- Budget validation
- AI response parsing
- Image upload validation
- Recommendation history isolation

---

## 🚀 Future Enhancements

Possible improvements for the next version:

- 🗄️ Persistent database storage
- 👤 User profile management
- 📊 Budget analytics and charts
- 📈 Spending trends
- 💾 Export plans to PDF/Excel
- 🔄 Edit and regenerate recommendations
- ⭐ Save favorite recommendations
- 🔔 Budget alerts
- 🛒 Live product/price integrations
- 📍 Location-aware venue recommendations
- 🌐 Multi-language support
- 📱 Progressive Web App/mobile support
- 🧪 Automated unit and integration tests
- ☁️ Production deployment configuration
- 🔐 Stronger production-grade security

---

## 🐛 Troubleshooting

### `No Google API key found`

Make sure `.env` contains:

```env
GOOGLE_API_KEY=your_gemini_api_key
```

Then restart the application.

### Dependency installation fails

Upgrade pip and reinstall:

```bash
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### Port 8000 is already in use

Run Uvicorn on another port:

```bash
uvicorn app:app --host 127.0.0.1 --port 8001 --reload
```

Then visit:

```text
http://127.0.0.1:8001
```

### AI response parsing errors

Gemini output is expected to be JSON. If the model returns malformed output, the backend may return an error. Check the server terminal for the underlying exception and verify that the configured Gemini API credentials/model access are valid.

---

## 📦 Deployment Notes

For production, do not use:

```bash
uvicorn app:app --reload
```

Use a production process manager/server configuration appropriate to your hosting environment.

Before deployment, review:

- Secrets
- CORS policy
- Database persistence
- File upload security
- HTTPS
- Logging
- Rate limits
- AI API quotas
- Error handling

---

## 🤝 Contributing

Contributions are welcome.

Suggested workflow:

```bash
git checkout -b feature/your-feature
```

Make your changes, test them locally, and submit a pull request with:

- A clear description
- Screenshots for UI changes
- Tests for backend changes where applicable
- No secrets or `.env` files

---

## 📄 License

No license file is currently included in the project.

If this project is intended for public distribution, add an appropriate license such as MIT, Apache-2.0, or another license that matches the project's ownership and usage requirements.

---

## 👨‍💻 Project Summary

**PocketSmart AI** combines:

> **User Budget + Personal Requirements + Gemini AI → Practical Budget Plan**

It is a strong foundation for an AI-assisted personal planning platform and can be extended with persistent storage, live commerce integrations, analytics, and production-grade security.

---

### ⭐ If you find this project useful

Consider improving it with tests, documentation, database persistence, and additional AI-powered planning modules.
