Aria2 with ariang
---
Only 29Mb.  
Edit config file out of the image.  
Move file completed to another folder.  
(Tasks that contains more than one files will not be moved.)  

### Install
I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 \
-p 6880:80 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/conf \
-e SECRET=YOUR_SECRET_CODE \
xujinkai/aria2-with-webui
```
  
II. Open `http://serverip:6880/` for aria2-ng.  

### Build:  
`sudo docker build -f Dockerfile -t damir/aria2-with-ariang .`  

### Link:  
https://github.com/aria2/aria2 