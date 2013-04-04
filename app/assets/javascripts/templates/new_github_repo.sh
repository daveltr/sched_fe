$USER = "NRION"
$WD = ??
curl -u 'nrion' https://api.github.com/user/repos -d '{"name":$WD}'
git remote add origin git@github.com:USER/REPO.git
git push origin master