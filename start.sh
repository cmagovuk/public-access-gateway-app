
# development environment variables
export RFI_DEV_DB_SERVER="rfi_development"
export RFI_DEV_DB_USERNAME="dbadmin"
export RFI_DEV_DB_PASSWORD="password"

export RFI_TEST_DB_SERVER="rfi_development"
export RFI_TEST_DB_USERNAME="dbadmin"
export RFI_TEST_DB_PASSWORD="password"

# start rails
# bin/dev

bundle exec rails db:migrate
bundle exec rails s -b '0.0.0.0'