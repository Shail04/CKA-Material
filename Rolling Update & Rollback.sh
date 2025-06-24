#ROLLING UPDATE AND ROLLBACK
kubectl rollout status deployment/nameofdeployment                           #to check the status of a deployment rollout
kubectl rollout pause deployment/nameofdeployment                            #to pause a deployment rollout
kubectl rollout resume deployment/nameofdeployment                           #to resume a paused deployment rollout
kubectl rollout restart deployment/nameofdeployment                          #to restart a deployment
kubectl rollout history deployment/nameofdeployment                          #to view the rollout history of a deployment
kubectl rollout history deployment/nameofdeployment --revision=(revisionnumber)    #to view the details of a specific revision in the rollout history
kubectl rollout undo deployment/nameofdeployment                                   #to rollback a deployment to the previous revision
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber)    #to rollback a deployment to a specific revision
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) --dry-run=client    #to preview the rollback to a specific revision without applying it
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) -o yaml             #to preview the rollback to a specific revision in YAML format
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) -o json             #to preview the rollback to a specific revision in JSON format
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) -o yaml > rollback.yaml     #to save the rollback to a specific revision in YAML format to a file
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) -o json > rollback.json     #to save the rollback to a specific revision in JSON format to a file
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) --dry-run=server            #to preview the rollback to a specific revision without applying it on the server side
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) --dry-run=server -o yaml        #to preview the rollback to a specific revision in YAML format without applying it on the server side
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) --dry-run=server -o json        #to preview the rollback to a specific revision in JSON format without applying it on the server side
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) --dry-run=server -o yaml > rollback.yaml        #to save the preview of the rollback to a specific revision in YAML format to a file without applying it on the server side
kubectl rollout undo deployment/nameofdeployment --to-revision=(revisionnumber) --dry-run=server -o json > rollback.json        #to save the preview of the rollback to a specific revision in JSON format to a file without applying it on the server side

#CONFIGMAP
kubectl get configmaps
kubectl describe configmaps
kubectl create configmap  (nameofconfigmap) --from-literal=(key=value) --from-literal=(key=value)

#SECRET
kubectl get secrets
kubectl describe secrets
kubectl create secret generic  --from-literal=(key=value)

echo -n 'nameforencode' | base 64 ( to encode a secret instead of writing in plaintext)
echo -n 'nameforencode' | base 64 --decode (to decode a secret)

#HPA (Horizontal Pod Autoscaling)
kubectl scale deployment (nameofdeployment) --replicas=(number)
kubecctl autoscale deployment (nameofdeployment) --cpu-percent=(number) --min=(number) --max=(number)

#IN-PLACE RESIZE OF POD RESOURCES
FEATURE_GATES=InPlacePodVerticalScaling=true

#VPA (Vertical Pod Autoscaling)

