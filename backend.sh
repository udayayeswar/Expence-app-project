dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y
cp backend.service /etc/systemd/system/backend.service

useradd expense

mkdir /app

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip


npm install
systemctl daemon-reload
systemctl enable backend
systemctl start backend

dnf install mysql -y

mysql -h 172.31.34.153 -uroot -pExpenseApp@1 < /app/schema/backend.sql