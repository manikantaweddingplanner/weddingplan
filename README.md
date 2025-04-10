# 💍 Wedding Planner Laravel App

A full-featured wedding planner platform with:

- 🎛️ Admin Dashboard (Filament)
- 🏛️ Vendor & Venue Management
- 📅 Booking Calendar
- 💬 Live Chat System
- 💳 Razorpay Payments
- 🧾 Invoice Downloads & Emails
- 📊 Analytics + Export + Notifications

---

## 🚀 Setup Instructions

1. Clone the repository and install dependencies:

```bash
composer install
npm install && npm run build
cp .env.example .env
php artisan key:generate
```

2. Set up your `.env` with DB + Razorpay + Mail credentials.

3. Run migrations and seeders:

```bash
php artisan migrate --seed
```

4. Serve the app:

```bash
php artisan serve
```

---

## 🧾 Invoices + Payments

- Uses Razorpay for payments.
- Invoices are generated after successful payments.
- PDF download + email sent automatically.

---

## 📊 Analytics & Reports

- Filterable charts
- Export to PDF/Excel
- Weekly summary email sent to admins

---

## 🛠 Deployment (Render or Forge)

1. Use Render.com or Laravel Forge.
2. Add environment variables.
3. Configure DB + queue.
4. Add scheduler: `* * * * * php /path-to-artisan schedule:run >> /dev/null 2>&1`

Done! 🎉