# Global Methane Initiative (GMI) Web Portal — No Contact Version

This repository contains the source code for the **Global Methane Initiative (GMI)** web portal — a VB.NET WebForms application designed to support international collaboration on methane reduction efforts.

This version has been modified to **remove all contact functionality** from the website.

## 🚀 Overview

- **Framework:** ASP.NET WebForms (VB.NET)
- **Backend:** Microsoft SQL Server
- **Repository Status:** Cleaned and optimized for GitHub (large files removed, custom `.gitignore` in place)

## 🔧 Tech Stack

| Layer        | Technology              |
|--------------|--------------------------|
| Frontend     | HTML, JavaScript, ASPX   |
| Backend      | VB.NET (ASP.NET WebForms)|
| Database     | Microsoft SQL Server     |
| Hosting      | IIS (local/staging/prod) |

## 💠 Development Setup

1. **Clone the repo:**
   ```bash
   git clone https://github.com/dharrowerTt/gmi_noContact.git
   ```

2. **Open in Visual Studio (2022 or later)**

3. **Configure connection strings:**
   Edit `Web.config` to point to your local SQL Server instance.

4. **Run locally with IIS Express**

## 📂 Folder Structure

<pre>
/assets         - Images, static content
/documents      - Local file resources (excluded from Git)
/bin, /obj      - Build output (excluded from Git)
/challenge      - Section with media-rich content
*.aspx, *.vb    - WebForms pages and code-behind
</pre>

## 📌 Notes

- Large media files (e.g., `.mp4`, `.zip`, `.mov`) have been removed from Git history to meet GitHub size requirements.
- If needed, they can be hosted externally or attached to GitHub Releases.
- Contact-related pages and functionality have been intentionally removed in this version.

## 🧼 Git History Cleanup

This repo was rewritten using `git-filter-repo` to remove large committed files from history. Current repo size is under GitHub’s limits.

## 🤝 Contributing

This is an internal project. If you'd like to contribute, please reach out to the development team lead.

---

Maintained by [@dharrowerTt](https://github.com/dharrowerTt)
