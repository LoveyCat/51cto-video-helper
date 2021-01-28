# 51cto-video-helper
## Usage:
1. You must bought the courses;
2. Login you 51cto account with Google Chrome for Firefox, play the video you want to download, Press F12 to open development tools, go to network, input keywords "key" to filter, then you will get your encode key.
3. open decode-key.html with Google Chrome or Firefox, Press F12 to open development tools and go to console, fill in this code and press enter, then you will get your decode key.
```
decode("WiTJiRMUs1tWWiY0WTJOYW1NRGxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","123456") 
```
In this fileds WiTJiRMUs1tWWiY0WTJOYW1NRGxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx is your encode key and 123455 your courseID.
4. Copy the decode key and go to https://www.bejson.com/convert/ox2str/ , transfer your key to Hexadecimal。
5. Fill the Hexadecimal into dl.sh with key value
6. Back to the video page with development tools, use m3u8 to filter; then you will get the url and the Cookies, input the Cookies into dl.sh
7. Run `bash dl.sh`, you will be notice to input url and filename you want to save,  just copy and paste. This will downlod all ts files and paste into a full ts file, you just need to wait, it will be decode by self.
8. Go to Downloads directory to find your video.
9. Just enjoy it!

> Tips:
Cookies and key can be expired with unkown time, if you can't download or decode the ts file, you'd better check your Cookies and key.

> Note:
This shell script only tested with my courses.
