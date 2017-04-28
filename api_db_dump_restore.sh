ssh root@api-user.plantwithbloom.com 'cd /app/bloom-docker && docker-compose run db pg_dump -U postgres bloom_production -h db -F t > production_api.dump'
scp root@api-user.plantwithbloom.com:/app/bloom-docker/production_api.dump ./production_api.dump
ssh root@api-user.plantwithbloom.com 'rm /app/bloom-docker/production_api.dump'
docker-compose exec db pg_restore --verbose --clean --no-acl --no-owner -h db -U postgres -d bloom_development /restore/production_api.dump
rm ./production_api.dump
