function widget(w, i, d, g, e, t, s) {
  var iapp = document.createElement('app-top')
  document.getElementsByTagName('body')[0].appendChild(iapp)
  var link = document.createElement('link')
  link.setAttribute('rel', 'stylesheet')
  link.setAttribute('type', 'text/css')
  link.setAttribute(
    'href',
    'https://apps.clientify.net/formbuilderembed/scripts/stylessimple.css'
  )
  document.getElementsByTagName('head')[0].appendChild(link)
  var uDiv = document.createElement('div')
  uDiv.id = '1913'
  uDiv.className = 'uscript_top'
  document.getElementsByTagName('body')[0].appendChild(uDiv)
  var iDiv = document.createElement('div')
  iDiv.id = '18237'
  iDiv.className = 'script1_top'
  document.getElementsByTagName('body')[0].appendChild(iDiv)
  var iDiv2 = document.createElement('div')
  iDiv2.id = 'toppopupform'
  iDiv2.className = 'script3_top'
  document.getElementsByTagName('body')[0].appendChild(iDiv2)
  w[d] = w[d] || []
  t = i.createElement(g)
  t.async = 1
  t.src = e
  s = i.getElementsByTagName(g)[0]
  s.parentNode.insertBefore(t, s)
}

widget(
  window,
  document,
  '_gscq',
  'script',
  'https://apps.clientify.net/formbuilderembed/scripts/embed_top.js'
)
