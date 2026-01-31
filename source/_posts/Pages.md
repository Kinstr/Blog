---
title: Host Hexo on Cloudflare/Aliyun Pages
categories: 
    - [Tutorial, Pages]
date: 2026-01-31 11:44:52
tags:
    - Hexo
    - Pages
description: I will demonstrate the process of deploying a Hexo blog via Cloudflare/Aliyun Pages in this guide.
---
# Introduction

In the world of modern web development, **Cloudflare Pages** and **Aliyun (Alibaba Cloud) Pages** have emerged as two of the most reliable platforms for deploying static sites like Hexo. Both services leverage "Jamstack" architecture, allowing you to host your blog without the overhead of managing a traditional virtual private server (VPS).

* **Global Speed:** It utilizes Cloudflare’s massive edge network to serve your content from the nearest data center to your visitor.
* **Developer Experience:** It features seamless "Git-to-deployment" automation—simply push your code to GitHub or GitLab, and Cloudflare/Aliyun handles the rest.
* **Security:** Every site comes with enterprise-grade DDoS protection and automatic SSL by default.

Whether you prioritize a global reach or a localized performance edge, this tutorial will guide you through the nuances of deploying your Hexo blog on both platforms.

# Getting Started
- Install Hexo locally by following the guide on the official website: [https://hexo.io/](https://hexo.io/)
- Push your locally modified blog source code to a GitHub repository. Make sure to remember the **repository name** and the **branch** where your source code is stored. In this tutorial, I am using:
    * **Repository:** `blog`
    * **Branch:** `Hexo-Next`

# Cloudflare Pages

Log in to the [**Cloudflare Dashboard**](https://dash.cloudflare.com/). Navigate to **Compute & AI** > **Workers & Pages**, then click **Create application**. 
<img src="/img/posts/Build  Compute & AI  Workers & Pages  kinskr  Cloudflare - Google Chrome_2026-01-31_12-49-27.webp">
On the next screen, click the link at the bottom: <center>Looking to deploy Pages? <b>Get started</b></center> 
<img src="/img/posts/Build  Compute & AI  Workers & Pages  kinskr  Cloudflare - Google Chrome_2026-01-31_12-52-27.webp">
On the next page, select **"Import an existing Git repository"**, then choose the repository where your Hexo blog source code is stored. 
<img src="/img/posts/Build  Compute & AI  Workers & Pages  kinskr  Cloudflare - Google Chrome_2026-01-31_12-55-42.webp">
Next, configure the build settings on the **"Set up builds and deployments"** page.
{% codeblock %}
Production branch: Hexo-Next
Framework preset: None
Build command: npm install -g npm@latest && npm run build
Build output directory: public
{% endcodeblock %}
<img src="/img/posts/Build  Compute & AI  Workers & Pages  kinskr  Cloudflare - Google Chrome_2026-01-31_12-58-22.webp">
Finally, when the build process is complete, you will be able to access your Hexo blog via the provided <b>Cloudflare Pages subdomain</b>. You can also bind a <b>custom domain</b> to your project later for a more professional look.

# Aliyun Pages

Access the **Aliyun Pages dashboard** (https://esa.console.aliyun.com/edge/pages/list). Click **"Create"** to enter the **Create Function** page. Select **"Import from GitHub Repo"**, and then choose the repository where your Hexo blog source code is stored.
<img src="/img/posts/ESA - Google Chrome_2026-01-31_13-05-37.webp">
<img src="/img/posts/ESA - Google Chrome_2026-01-31_13-06-57.webp">
Click **Next** to proceed to the **Configure** page. Please refer to the image below for the configuration settings.
{% codeblock %}
Prod: Hexo-Next
Install Command: npm install
Build: chmod +x ./node_modules/.bin/hexo && npx hexo generate
Static Assets Dir: ./public
Node.js: 22.x
{% endcodeblock %}
<img src="/img/posts/ESA - Google Chrome_2026-01-31_13-38-07.webp">
Then, click <b>Start Deploy</b>. After the build is complete, you can add your own <b>Custom Domains</b> on the <b>Domain Names</b> page. (Please note that an <b>ICP Filing/License</b> is required for domains hosted on Aliyun).

