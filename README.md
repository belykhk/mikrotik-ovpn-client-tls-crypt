# OpenVPN client for Mikrotik router with tls-crypt support

## Build

Create `client.ovpn` file with connection configuration with embedded certs in it.

```
docker buildx build --no-cache --platform linux/arm/v6 -t ovpn .
docker save ovpn -o ovpn.tar
```

Expected size of output container is ~12.3M. Platform may differ based on your router's cpu.

## Run

1. Upload tar to device
1. Create veth with ip
1. Create container from tar
1. Create routing rules through veth

## Additional info about running containers on Mikrotik routers

https://help.mikrotik.com/docs/display/ROS/Container
