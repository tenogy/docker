# Building & Running

To build:

	# docker build --rm -t sandbox .

To run:

	# docker-compose up -d

To access:

	ssh -p 49100  maple@localhost
	ssh-keygen -R [localhost]:49100