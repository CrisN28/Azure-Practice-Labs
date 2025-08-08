# VM App 1
sudo mkdir -p /var/www/html/clients
echo "Welcome to the Clients Portal" | sudo tee /var/www/html/clients/index.html

# VM App 2
sudo mkdir -p /var/www/html/employees
echo "Welcome to the Employees Portal" | sudo tee /var/www/html/employees/index.html

# VM App 3
sudo mkdir -p /var/www/html/billing
echo "Welcome to the Billing System" | sudo tee /var/www/html/billing/index.html