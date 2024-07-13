sudo dnf install -y git httpd policycoreutils-python-utils
sudo vim /etc/httpd/conf.d/git.conf
sudo htpasswd -c /etc/httpd/conf.d/git.passwd bob
sudo mkdir -m 0755 /repos
sudo chown apache. /repos
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/repos(/.*)?"
sudo restorecon -Rv /repos
sudo systemctl enable --now httpd
cd /repos
sudo -u apache git init --bare test.git
cd
git clone http://localhost/repos/test.git
cd test
echo hello > Readme
git add .
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git commit -m "first"
git push