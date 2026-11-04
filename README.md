# Arian Jay G. Maala — Personal Portfolio

A static portfolio website: HTML, CSS, and vanilla JavaScript, with no database and no server code. Everything a visitor needs is in the `public/` folder.

## Preview it on your computer

Browsers block this site's scripts when an HTML file is opened directly, so use a small local server:

```bash
python -m http.server 5500 --directory public
```

Then open http://localhost:5500.

## Put it online

Upload the **`public` folder** to any static host, such as Netlify, Cloudflare Pages, Vercel, or GitHub Pages. There is no build step. On Netlify, for example, you can drag the folder onto its deploy page.

## Edit your content with the editor

Double-click **`Open Portfolio Editor.bat`**. It opens the editor in Microsoft Edge (it also works in Chrome, but not Firefox or Safari).

1. The first time, press **Choose folder**, pick `My Portfolio\public`, and allow editing.
2. Edit your details, or press **Upload** next to a photo or certificate. Large photos are shrunk automatically.
3. Press **Save changes**, or Ctrl+S.
4. To update the online version of your site, upload the `public` folder to your host again.

The editor saves into `public/data/portfolio.json` and `public/assets/`, and keeps the version from before your first save of each session in `public/data/portfolio.backup.json`. It has no password because it needs none: it can only change a folder on the computer it is opened on, so a visitor who finds the page can't touch your site.

## Edit the file by hand

All content is in [`public/data/portfolio.json`](public/data/portfolio.json). Keep it valid JSON.

| To change | Edit |
| --- | --- |
| Name, biography, contact details | `profile` |
| Profile photo | Put the file in `public/assets/images/`, then set `profile.profileImageUrl` to `assets/images/your-photo.jpg` |
| Education, skills, research, experience, achievements, trainings | The list with that name |
| Project Software | `systems`: each has a `name`, a `url`, and a `photoUrl` for its background |
| Social links | `socialLinks`, for example `{ "platform": "GitHub", "url": "https://github.com/you" }` |
| Résumé & CV | Put the files in `public/assets/documents/`, then set `resumeUrl` and `cvUrl`, for example to `assets/documents/resume.pdf`. The section stays hidden while both are empty |
| Chatbot | `chatbot`: turn it on or off, the welcome message, suggested questions, and `approvedFacts` (a list of extra facts as sentences) |

Section headings and navigation labels are in `public/index.html`. The intro animation's text is in `DEFAULTS` at the top of `public/js/loading.js`.

## How the features work without a server

- **Contact form:** opens the visitor's email app with the message filled in, so the visitor still sends it from there. Nothing is stored. To receive messages directly on the site, you would need a form service such as Formspree.
- **Chatbot:** runs in the browser and quotes facts from `portfolio.json` word for word, or says it has no information. It uses no AI model, so it can't invent anything, but it also can't rephrase or reason about a question.
- **Visibility:** `"isPublished": false` on a project or `"isConfirmed": false` on an experience point hides it from the page. It is still readable in the public JSON file, so don't put private information there.

## The `archive/` folder

`archive/server-version/` holds the earlier version with the PostgreSQL database, the `/admin` CMS, and the AI chatbot. Nothing in `public/` uses it, and it should not be uploaded. Keep it if you might want those features later, or delete it along with `node_modules/`.
