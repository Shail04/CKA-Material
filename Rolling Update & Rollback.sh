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
kubectl get configmaps                                                      #to get all configmaps
kubectl get cm                                                              #to get all configmaps (short form)
kubectl get configmap (nameofconfigmap)                                     #to get a specific configmap
kubectl describe configmap (nameofconfigmap)                                #to describe a specific configmap
kubectl create configmap (nameofconfigmap) --from-file=(path/to/file)       #to create a configmap from a file
kubectl create configmap (nameofconfigmap) --from-file=(path/to/file1) --from-file=(path/to/file2)                 #to create a configmap from multiple files
kubectl create configmap (nameofconfigmap) --from-env-file=(path/to/envfile)                                       #to create a configmap from an environment file            
kubectl create configmap (nameofconfigmap) --from-literal=(key=value)                                              #to create a configmap from a literal key-value pair
kubectl create configmap (nameofconfigmap) --from-literal=(key=value) --from-literal=(key=value)                   #to create a configmap from multiple literal key-value pairs
kubectl create configmap (nameofconfigmap) --from-literal=(key=value) --from-literal=(key=value) --from-file=(path/to/file)             #to create a configmap from a literal key-value pair and a file
kubectl create configmap (nameofconfigmap) --from-literal=(key=value) --from-literal=(key=value) --from-env-file=(path/to/envfile)      #to create a configmap from multiple literal key-value pairs and an environment file
kubectl create configmap (nameofconfigmap) --from-literal=(key=value) --from-literal=(key=value) --from-file=(path/to/file) --from-env-file=(path/to/envfile)       #to create a configmap from multiple literal key-value pairs, a file, and an environment file
kubectl create configmap (nameofconfigmap) --from-literal=(key=value) --from-literal=(key=value) --from-file=(path/to/file) --from-env-file=(path/to/envfile) --dry-run=client -o yaml > configmap.yaml     #to create a configmap from multiple literal key-value pairs, a file, and an environment file, and save it to a YAML file without applying it

#SECRET
kubectl get secrets                                         #to get all secrets     
kubectl describe secrets                       #to describe all secrets 
kubectl create secret generic  --from-literal=(key=value)                             #to create a secret from a literal key-value pair
kubectl create secret generic (nameofsecret) --from-literal=(key=value)                #to create a secret with a specific name from a literal key-value pair
kubectl create secret generic (nameofsecret) --from-literal=(key=value) --from-literal=(key=value)   #to create a secret with a specific name from multiple literal key-value pairs
kubectl create secret generic (nameofsecret) --from-file=(path/to/file)                #to create a secret from a file
kubectl create secret generic (nameofsecret) --from-file=(path/to/file1) --from-file=(path/to/file2)   #to create a secret from multiple files
kubectl create secret generic (nameofsecret) --from-env-file=(path/to/envfile)     #to create a secret from an environment file
kubectl create secret generic (nameofsecret) --from-literal=(key=value) --from-file=(path/to/file)   #to create a secret from a literal key-value pair and a file
kubectl create secret generic (nameofsecret) --from-literal=(key=value) --from-file=(path/to/file) --from-env-file=(path/to/envfile)   #to create a secret from a literal key-value pair, a file, and an environment file
kubectl create secret generic (nameofsecret) --from-literal=(key=value) --from-literal=(key=value) --from-file=(path/to/file) --from-env-file=(path/to/envfile)   #to create a secret from multiple literal key-value pairs, a file, and an environment file
kubectl create secret generic (nameofsecret) --from-literal=(key=value) --from-literal=(key=value) --from-file=(path/to/file) --from-env-file=(path/to/envfile) --dry-run=client -o yaml > secret.yaml   #to create a secret from multiple literal key-value pairs, a file, and an environment file, and save it to a YAML file without applying it
kubectl create secret generic (nameofsecret) --from-literal=(key=value) --from-literal=(key=value) --from-file=(path/to/file) --from-env-file=(path/to/envfile) --dry-run=client -o json > secret.json   #to create a secret from multiple literal key-value pairs, a file, and an environment file, and save it to a JSON file without applying it
echo -n 'nameforencode' | base 64 ( to encode a secret instead of writing in plaintext)                                    
echo -n 'nameforencode' | base 64 --decode (to decode a secret)                             

#HPA (Horizontal Pod Autoscaling)
kubectl scale deployment (nameofdeployment) --replicas=(number)                                                #to scale a deployment to a specific number of replicas      
kubecctl autoscale deployment (nameofdeployment) --cpu-percent=(number) --min=(number) --max=(number)           #to create an HPA for a deployment with specific CPU utilization and min/max replicas   

#IN-PLACE RESIZE OF POD RESOURCES
FEATURE_GATES=InPlacePodVerticalScaling=true                               #to enable in-place pod vertical scaling feature gate
kubectl patch deployment (nameofdeployment) -p '{"spec":{"template":{"spec":{"containers":[{"name":"(containername)","resources":{"requests":{"cpu":"(cpuvalue)","memory":"(memoryvalue)"},"limits":{"cpu":"(cpuvalue)","memory":"(memoryvalue)"}}}]}}}}'   #to patch a deployment with new resource requests and limits for a specific container

#VPA (Vertical Pod Autoscaling)

