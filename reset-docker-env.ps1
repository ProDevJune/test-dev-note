# Docker 환경 초기화 및 재시작 스크립트

# 1. 모든 컨테이너 중지 및 삭제
Write-Host "Stopping and removing all containers..."
$containers = docker ps -aq
if ($containers) {
    docker stop $containers
    docker rm $containers
} else {
    Write-Host "No containers to stop or remove."
}

# 2. 모든 이미지 삭제
Write-Host "Removing all images..."
$images = docker images -q
if ($images) {
    docker rmi $images -f
} else {
    Write-Host "No images to remove."
}

# 3. 모든 볼륨 삭제
Write-Host "Removing all volumes..."
docker volume prune -f

# 4. 사용되지 않는 네트워크 삭제
Write-Host "Removing unused Docker networks..."
docker network prune -f

# 5. 시스템 정리
Write-Host "Cleaning up Docker system..."
docker system prune -a -f --volumes

# 6. 모든 빌드 캐시 삭제
Write-Host "Deleting all build caches..."
docker builder prune -a -f

# 7. Docker Desktop Builds에서 빌드 데이터 삭제
Write-Host "Removing Docker Desktop build data..."
docker buildx prune -a -f

# 8. Git 커밋 해시 가져오기
# Write-Host "Getting Git commit hash..."
# if (Get-Command git -ErrorAction SilentlyContinue) {
#     $env:GIT_COMMIT = git rev-parse HEAD
# } else {
#     Write-Host "Git is not installed. Using default commit hash."
#     $env:GIT_COMMIT = "unknown"
# }

# 9. custom-nginx 이미지를 빌드
Write-Host "Building custom-nginx image..."
docker build -t custom-nginx -f docker/Dockerfile.nginx docker/

# 10. Docker Compose로 프로젝트 재시작
Write-Host "Restarting the project with Docker Compose..."
docker-compose -f docker/docker-compose.yml --env-file docker/.env.staging up -d --build

Write-Host "Docker environment has been reset and the project has been restarted in staging mode."
