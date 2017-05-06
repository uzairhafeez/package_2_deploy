echo "FE Bundle"

packageNum=`php testRabbitMQClient.php frontendPackage-v | xargs`

	cd temp/
	mkdir frontend
	
	DIR=/home/uzair/FE
	
        cp -a $DIR* frontend/
	cd ..
	
        tar -czvf frontendPackage-v"$packageNum".tar.gz -C temp/frontend .
	
        rm -r temp/frontend/
	
	echo `ls | grep frontendPackage-v"$packageNum"`
	echo "Success"
	echo "Package is ready to deploy"
	
	scp -r frontendPackage-v"$packageNum".tar.gz uzair@192.168.2.30:/home/uzair/Packages/
	
	cp frontendPackage-v"$packageNum".tar.gz frontendPackages/
	
	rm frontendPackage-v"$packageNum".tar.gz
	
	php updatePackage.php frontendPackage-v"$packageNum".tar.gz "$packageNum"

