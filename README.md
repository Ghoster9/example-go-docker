# example-go-docker

Hal pertama ambil image golang di [hub](https://hub.docker.com/_/golang) biasanya jika sudah ada Dockerfile maka akan otomatis mendowload images yang diperlukan.

```sh
docker pull golang:1.16.4
```

Lalu buat Dockerfile pada project

exampel code Dockerfile

```
FROM golang:1.16.4
```

Ambil images dari golang dengan tag

Kemudian copy file dari directori komputer saat ini ke dalam docker images

```
COPY main.go /app/main.go
```

Kemudian perintah menjalankan dilakukan dalam bentuk array string

```
CMD ["go", "run", "/app/main.go"]
```

Maka saat dijalan proses akan seperti `go run main.go`
Sedangkan `/app/main.go merupakan file dalam images nantinya.

Untuk mem build dilakukan perintah

```sh
docker build --tag app-golang:1.0 .
```

Yang memberitahu bahwa docker dengan nama app-golang dan tag 1.1 maka akan di bundle menjadi images dan lokasi . folder saat ini.

Setelah di bundle maka file images golang:1.16.4 tidak di perlukan lagi di dalam docker karena sudah di bundle didalam images baru kita. untuk itu golang:1.16.4 tidak perlu dijalankan.

Untuk membuat container dan menjalankan maka dapat dilakukan seperti ini.

```sh
docker container create --name app1 -p 8080:8080 app-golang:1.0
```

ini akan di direct ke port 8080: yang didalam docker juga 8080.

Untuk menjalankan maka

```sh
docker container start app1
```
