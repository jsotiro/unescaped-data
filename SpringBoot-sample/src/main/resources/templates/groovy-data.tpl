yieldUnescaped '<!doctype html>'
    html(lang: 'en') {
        head {
            meta(charset: 'UTF-8')
            title('Hello')
        }
        body {
            h2("This page was generated using a Groovy Template")
            p "$data"
        }
}
