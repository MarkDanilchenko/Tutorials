## App Description &#128209;

This is a simple CRUD project with JWT authorization based on using such technologies as: Vue3, Bootstrap5, Django Rest Framework, Webpack, PostgreSQL and NGINX.

## Launch instructions &#128190;

&#9881;**Frontend**:

- Vue3;
- Bootstrap5;
- Webpack + prettier + eslint.
  
&#9881;**Backend**:

- DRF;
- Docker;
- PostgresQL;
- NGINX;

<div style="display: flex; justify-content: end;">
  <p>Git and Docker should be installed locally on Your PC.</p>
</div>

---

1. Clone repository to Your local path:

    ```sh
    cd <your_local_path> && git clone <http/ssh-link>
    ```

2. Run compose:

    ```sh
    cd Tutorials && docker compose --env-file ./.env.public up --build
    ```

3. After the installation is complete the web-app will start on `_`;

- Open web-app in browser using URL: <http://_/>

4. The superuser(admin) is NOT created automatically. To create it by yourself follow the instructions below in the new terminal (related docker containers must be in use):

    4.1 Create superuser:

    ```sh
    docker exec -it server python manage.py createsuperuser --noinput --username admin --email admin@example.com
    ```

    4.2 Note, that default password is already preset in the script above. Default credentials are:

    ```js
        {
          username: admin;
          email: admin@example.com;
          password: admin;
        }
    ```

    - for another password preset it should be **changed FIRST** in ./.env.public `DJANGO_SUPERUSER_PASSWORD=` and then run point 4.1.

    4.3 For changing already existing superuser's password (not password preset):

    ```sh
    docker exec -it server python manage.py changepassword admin
    ```

    - you will be prompted to set another password.

5. Stop the web-app press in current terminal:

    ```sh
    Ctrl + C
    ```

    or

    ```sh
    docker compose --env-file ./.env.public stop
    ```

6. Start again the web-app:

    ```sh
    docker compose --env-file ./.env.public start
    ```

7. To completely remove all related docker containers, docker images, volumes and related data:

    ```sh
    docker compose --env-file ./.env.public down --volumes --rmi all
    ```

    <span style="color: rgb(255, 0, 0)">After this step, it is need to go back to point №2 to run web-app again.</span>

---

### p.s

- Local environment variables can be changed in the `./.env.public`<br/>
- Outer ports of both django-server & postgresql are `8001` & `5433` respectively and could not be changed via environment.

## Screenshots &#127745;

1. *Main page (light & dark themes)*

![Main page(dark theme)](screenshots/ScrShot_1.png)
![Main page(light theme)](screenshots/ScrShot_2.png)
  
2. *SignUp/SignIn blocks*

![SignUpForm](screenshots/ScrShot_9.png)
![SignInForm](screenshots/ScrShot_10.png)

3. *Tutorials page with content*

![Tutorials content 1](screenshots/ScrShot_3.png)
![Tutorials content 2](screenshots/ScrShot_4.png)

4. *Tutorial update form*

![Update form](screenshots/ScrShot_5.png)

5. *Mobile look like*

<div align="center">
  <img src="screenshots/ScrShot_6.png" width="50%" height="50%" alt='Mobile look 1'>
  <img src="screenshots/ScrShot_7.png" width="50%" height="50%" alt='Mobile look 2'>
  <img src="screenshots/ScrShot_8.png" width="50%" height="50%" alt='Mobile look 3'>
  <img src="screenshots/ScrShot_11.png" width="50%" height="50%" alt='Mobile look 4'>
</div>
