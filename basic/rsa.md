# 密钥

## DER和PEM编码

- DER： 基于二进制的编码。可以用CER或者CRT作为扩展名的的整数。比较合适的说法是“我有一个DER编码的证书”，而不是“我有一个DER证书”
- PEM： 基于ASCII(Base64)的编码。OpenSSL 使用 PEM 文件格式存储证书和密钥。

PEM 实质上是 base64 编码的二进制内容，再进行增加或裁剪特殊字符-、n、r、begin信息、end信息,如:
```shell
-----BEGIN CERTIFICATE-----
内容
-----END CERTIFICATE-----
```

## PCKS(The Public-Key Cryptography Standards)

PKCS由美国RSA公司及其合作伙伴制定的一组公钥密码学标准，其中包括证书申请、证书更新、证书作废表发布、扩展证书内容以及数字签名、数字信封的格式等方面的一系列相关协议。  
版本：现有PCKS1，PCKS3，PCKS5，PKCS6，PKCS7，PKCS8，PKCS9，PKCS10，PKCS11，PKCS12，PKCS13，PKCS14，PKCS15 等13个版本  
常用：PCKS1 和 PCKS8，本文使用 PCKS8 标准  
注：由于PKCS内容规范设计二进制，不方便使用，所以一般转成base64 后，用 pem 格式规范显示

- pcks1的pem格式头

```shell
//公钥
-----BEGIN RSA PUBLIC KEY-----
内容
-----END RSA PUBLIC KEY-----
//私钥
-----BEGIN RSA PRIVATE KEY-----
肉容
-----END RSA PRIVATE KEY-----
```

- pcks8的pem格式头

```shell
//公钥
-----BEGIN PUBLIC KEY-----
内容
-----END PUBLIC KEY-----
//私钥
-----BEGIN PRIVATE KEY-----
肉容
-----END PRIVATE KEY-----
```