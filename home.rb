
# Démarrez le programme CGI qui reçoit et renvoie les données require 'cgi'
require 'cgi'
cgi = CGI.new
# Après réception des données, retourne une réponse au format HTML
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # Sortez les données reçues avec cgi ['input'] et affectez-les à une variable locale
  # Obtenez des informations à partir du point de repère « entrée »
  get = cgi['input']
  #Retour de la réponse en HTML
  "<html>
    <body>
    <p> Goya of bad quality:</ p>
    <p>#{get} </ p>
    </body>
  </html>"
}