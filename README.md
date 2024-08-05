# Test Dev Note Project

This is a test project built with Docker, Nginx, and Vue3. The project is structured as follows:

- `test-dev-note`: The top-level project.
  - `docker`: Contains Docker-related files including Dockerfile and docker-compose.yml.
  - `test-dev-vue`: Used for building the Vue3 project.
- `test-dev-nginx`: Serves as the web server (configured in Docker, not an actual folder).

## Project Overview

This project is a demonstration of using Docker and Nginx to containerize a Vue3 application. It serves as a simple example to showcase how these technologies can be integrated to create a portable and easy-to-deploy application.

## Technologies Used

- **Vue3**: A progressive JavaScript framework for building user interfaces.
- **Docker**: A platform for developing, shipping, and running applications in containers.
- **Nginx**: A high-performance HTTP server and reverse proxy.

## Project Structure
test-dev-note/<br/>
├── docker/<br/>
│ ├── Dockerfile<br/>
│ ├── docker-compose.yml<br/>
│ └── .env.staging<br/>
├── test-dev-vue/<br/>
│ ├── src/<br/>
│ ├── public/<br/>
│ ├── Dockerfile<br/>
│ ├── .env.development<br/>
│ ├── .env.staging<br/>
│ ├── package.json<br/>
│ ├── vite.config.js<br/>
│ └── ...<br/>
└── README.md<br/>

- **src/**: Contains the Vue3 source code.
- **docker/**: Contains Docker-related files including Dockerfile and docker-compose.yml.
- **public/**: Static files served by Nginx.
- **test-dev-note/**: The top-level project directory.
- **test-dev-vue/**: Contains the Vue3 project for building.
- **test-dev-nginx**: Configured in Docker, not an actual folder.

## Running the Project

### Dev Mode

Dev mode is used for development and debugging. It runs directly using VS Code.

1. Open the `test-dev-vue` folder in VS Code.

2. Install dependencies:

    ```sh
    yarn install
    ```

3. Run the development server:

    ```sh
    yarn dev
    ```

4. Access the application:

    Open your browser and go to `http://localhost:5173`.

### Staging Mode

Staging mode is used for testing in an environment similar to production. It runs using Docker.

1. Build and run the Docker containers:

    ```sh
    cd docker
    docker-compose --env-file .env.staging up --build
    ```

2. Access the application:

    Open your browser and go to `http://localhost:5273`.

## Project Configuration

### Vite Configuration

The project uses Vite for the build process. The configuration is specified in `vite.config.js`. The build outputs are directed to the `dist` directory.

### Docker Configuration

- **Dockerfile**: Defines the build steps for the Vue3 application in `test-dev-vue`.
- **docker-compose.yml**: Defines the services for the application, including the Vue3 app and Nginx server.

### Environment Variables

The environment variables are specified in `.env.staging` and `.env.production` files, which are used during the Docker build process.

## License

This project is licensed under the MIT License.
