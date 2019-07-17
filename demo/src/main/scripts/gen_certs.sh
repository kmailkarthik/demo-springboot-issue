rm -f *.jks  *.pem *.cer *.p12
# Server keystore
keytool -genkey -noprompt -keyalg RSA -dname "CN=unknown, OU=unknown, O=unknown, L=unknown, S=unknown, C=unknown" -keystore demo_server.jks  -storepass demopass  -keypass demopass -ext SAN=dns:mydomain

# For client cert
keytool -genkey -noprompt -keyalg RSA -dname "CN=unknown, OU=unknown, O=unknown, L=unknown, S=unknown, C=unknown" -keystore demo_client.jks  -storepass demopass  -keypass demopass -ext SAN=dns:mydomain

#Convert jks to pem which will be used by curl
keytool -importkeystore -srckeystore demo_client.jks -srcstorepass demopass -destkeystore demo_client.p12 -deststoretype PKCS12  -deststorepass demopass -destkeypass demopass
openssl pkcs12 -in demo_client.p12 -out demo_client.pem -passin pass:demopass -passout pass:demopass

#Trust store in server to trust the client certificate
keytool -export -keystore demo_client.jks -file tmp.cer -storepass demopass
keytool -import -file tmp.cer -keystore trust_store.jks -storepass demopass -trustcacerts   -noprompt


