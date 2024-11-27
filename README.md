# CMA RFI Management Interface

This project is under development at the moment - the source code reflects the "in-progress" state of the code-base.


### Bootstrapping the system in the development environment

If you are in a development environment, you will need to bootstrap the system.

1. Create an environment variable called "DEV_EMAIL_ADDRESS" with an email address in it.
2. Run the following SQL in the dev application database (change the email address as required):

```
INSERT INTO users
	(name,email_address,status,superuser,created_at,updated_at)
	VALUES ('Developer','dev@domain.com','active',true,CURRENT_DATE, CURRENT_DATE);

UPDATE users
	SET created_by_id=(SELECT id FROM users WHERE email_address='dev@domain.com'),
	updated_by_id=(SELECT id FROM users WHERE email_address='dev@domain.com')
```

If you now run the rails web application in a session that has the environment variable, you should be able to access the administration interface.

### Notes for upgrading versions from before RBAC and templates was introduced

After launching the admin interface with su privileges, go to the system section, and "populate" the database. It will create system records, and back-populate fields as appropriate throughout the system as needed.

