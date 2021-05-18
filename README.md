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
Sedangkan `/app/main.go` merupakan file dalam images nantinya.

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

Untuk menjalankan maka:

```sh
docker container start app1
```

Untuk memberhentikan

```sh
docker container stop app1
```

---

# Push images to Registry(hub)

Untuk menjalankan kita perlu melihat jika sebelumnya docker telah membundle dengan baik aplikasi kita.

Kemudian kita bisa membuat Create repository di [hub](https://hub.docker.com/repositories)

Pastikan nama images docker sama dengan nama dengan nama repository yang ada di hub

untuk Upload images di local dengan username

```sh
docker tag app-golang:1.0 ahmadzky08/app-golang:1.0
```

Untuk membuat images di local dengan username/NAMAIMAGES:TAGS

Agar bisa dilihat di hub maka dapat

```sh
docker push ahmadzky08/app-golang:1.0
```

Untuk push ke registry.

Jangan khawatir jika file images besar itu dikarenakan ada package golang di dalamnya. Pada saat kita push ke hub/registry maka ia akan mengambil file golang dari library yang sudah ada tanpa perlu mengupload golang yang ada pada mechine kita.
