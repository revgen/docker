# HUGO

## Usage:

### Create new site

To create a new hugo site in the ```./src/``` directory:
```bash
docker run -it --rm -v "${PWD}/src":/site hugo new site first-site
```
```
cd src/first-site
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
echo "theme = 'ananke'" >> hugo.toml
cd ../..
```
```

To start a local web server
```bash
docker run -it --rm -v "${PWD}/src/first-site":/site -p 8080:1313 hugo server --bind 0.0.0.0
```

To build site
docker run -it --rm -v "${PWD}/src/first-site":/site hugo