
# to Check role s bindings :
```
gcloud projects get-iam-policy ecom-api-github-ankurdotcom
```


gcloud projects add-iam-policy-binding ecom-api-github-ankurdotcom \
  --member="serviceAccount:ecom-api-github-ankurdotcom@ecom-api-github-ankurdotcom.iam.gserviceaccount.com" \
  --role="roles/redis.admin"


gcloud projects add-iam-policy-binding ecom-api-github-ankurdotcom \
  --member="serviceAccount:ecom-api-github-ankurdotcom@ecom-api-github-ankurdotcom.iam.gserviceaccount.com" \
  --role="roles/pubsub.admin"

  gcloud projects add-iam-policy-binding ecom-api-github-ankurdotcom \
  --member="serviceAccount:ecom-api-github-ankurdotcom@ecom-api-github-ankurdotcom.iam.gserviceaccount.com" \
  --role="roles/cloudsql.admin"