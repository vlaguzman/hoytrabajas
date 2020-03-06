1. Clonar el repositorio del proyecto:
git clone git@bitbucket.org:vladimir_ht/ht-ror.git

# Se pueden agregar los siguientes alias al o tener en cuenta los comandos para las siguientes instrucciones ~/.bashrc

alias dc='sudo docker-compose'
alias run-web='dc run web'
alias run-bash='run-web /bin/bash'
alias run-rails='run-web bundle exec bin/rails'


2. Crear el archivo .env en la raíz del proyecto, solicitar a cualquier integrante el archivo actualizado

3. Copiar el directorio .ssh con las llaves de producción para poder desplegar correctamente. Solicitar a cualquier integrante del equipo el directorio correspondiente

4. Instalar Docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test" sudo apt update sudo apt install docker-ce
5. sudo docker-compose up

6. entrar al bash e instalar bundler
run-bash
gem install bundler

7. instalar gemas
run-web bundle install

8. entrar a bash y actualizar el yarn
run-bash
yarn install --check-files

9. correr migraciones
run-rails db:drop db:create db:migrate

10. correr bin/shot
run-web bin/shot
#########################################################
Recomendado antes de subir los cambios al repositorio
Guardar los cambios en la rama actual y crear las descripciones explicitas y en ingles
git add -A
git commit -m "this is a good description of my commit"
 
actualizar la master
git checkout master
git pull origin master
 
rebasar la rama vladimir/feature_name contra la master
git checkout vladimir/feature_name
git rebase master
 
Luego si se desea, se puede hacer un squash para unificar commits innecesarios de la rama vladimir/feature_name
git rebase master -i
 
subir los cambios a una rama en el repositorio
git push origin vladimir/feature_name:vladimir/feature_name --force

