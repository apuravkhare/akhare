# akhare
Repository for my personal site. The deployment is using GitHub pages on [this repo](https://github.com/apuravkhare/apuravkhare.github.io)

The source is written in Elm. To run the application locally, install elm and its dependencies, then
```
cd akhare
elm reactor
```
To compile the site to JS and render in `index.html`:
```
elm make src/Main.elm --output elm.js
elm make src/Mobile.elm --output elm_mobile.js
```
