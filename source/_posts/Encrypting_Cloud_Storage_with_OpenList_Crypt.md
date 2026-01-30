---
title: Encrypting Cloud Storage with OpenList Crypt
date: 2026-01-21 11:54:01
tags: 
    - Crypt
categories: 
    - [Tutorial, OpenList]
description: I will show you how to use the Crypt driver in OpenList to encrypt your local data before uploading it to the cloud. By doing this, you can protect your privacy and avoid triggering automated content filters or censors.
---

# Tools and versions used in this demo
- Operating System: Windows 11 Pro (Version 25H2)
- OpenList : v4.1.9

# Step-by-Step Implementation
## Install OpenList
You can learn more about OpenList on its official wbsite: [https://www.oplist.org/](https://www.oplist.org/)

To get started, download openList app that matches your operating system from the link below:
- GitHub Releases: [https://github.com/OpenListTeam/OpenList/releases](https://github.com/OpenListTeam/OpenList/releases)

## Run OpenList
After downloading the portable file (openlist.exe), follow these steps to get it running:
- Organize: Move the openlist.exe file into a dedicated folder to keep things tidy.
- Open Terminal: Open the Command Prompt (CMD) in that folder.
- Start the APP: Run the following command to start OpenList.
{% codeblock %}
openlist start
{% endcodeblock %}
- Access the Web Interface: [http://localhost:5244/](http://localhost:5244/)
The default username is admin and you can set your password by use the following command in terminal. 
{% codeblock %}
openlist admin set <your password>
{% endcodeblock %}

## Add BaiduNetdisk Driver
Follow the official documentation to mount your Baidu Netdisk. This will serve as the destination where your encrypted data is stored.
- Official Guide: [https://doc.oplist.org/guide/drivers/baidu](https://doc.oplist.org/guide/drivers/baidu)

## Configure the Crypt Driver
Follow the official documentation to add the Crypt driver: 
- Official Guide: [https://doc.oplist.org/guide/drivers/crypt](https://doc.oplist.org/guide/drivers/crypt)

During setup, set the **Remote path** to the Baidu Netdisk location you added in the previous step.

All set! You can now upload files directly to the folder that associated with OpenList Crypt drive. The data will be automatically encrypted and stored in your Baidu Netdisk, while remaining fully accessible and readable within the OpenList interface.

# Important Notes
- Do not check "try rapid" on the file upload page.
- Remember your password and salt!



