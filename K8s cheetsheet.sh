#Pods Cmds
kubectl get pods -A                                                                                    #to get all pods in all namespaces
kubectl get pods (nameofpod) -n (namespace)                                                            #to get a specific pod in a specific namespace
kubectl get pods (nameofpod) -n (namespace) -o wide                                                    #to get a specific pod in a specific namespace with more details
kubectl describe pod (nameofpod) -n (namespace)                                                        #to get details of a pod in a specific namespace
kubectl delete pod (nameofpod) -n (namespace)                                                          #to delete a pod in a specific namespace
kubectl get pods -n (namespace)                                                                        #to get all pods in a specific namespace
kubectl get pod (nameofpod) -o yaml                                                                    #to get the details of a specific pod in YAML format         
kubectl delete pod (nameofpod)                                                                         #to delete a specific pod
vim pod.yaml                                                                                           #to create a pod definition file in YAML format
cat pod.yaml                                                                                           #to view the contents of the pod definition file
kubectl create -f pod.yaml                                                                             #to create a pod from the YAML file   
kubectl apply -f pod.yaml                                                                              #to apply changes to a pod from the YAML file
kubectl get pods -o wide                                                                               #to get more details about the pods, including node information   
kubectl edit (type) (nameofpod)                                                                        #to edit a pod definition in the default editor
kubectl edit pod (nameofpod)                                                                           #to edit a specific pod definition in the default editor  
kubectl run (nameofpod) --dry-run=client -o yaml                                                       #to generate a pod definition in YAML format without creating it
kubectl run (nameofpod) --image=(image) --restart=Never --dry-run=client -o yaml                       #to generate a pod definition in YAML format with a specific image and no restart policy  
kubectl run (nameofpod) --dry-run=client -o yaml > (nameofpod .yaml)                                   #to generate a pod definition in YAML format and save it to a file
kubectl run (nameofpod) --image=(image) --restart=Never --dry-run=client -o yaml > (nameofpod .yaml)   #to generate a pod definition in YAML format with a specific image and no restart policy, and save it to a file
kubectl get pod webapp -o yaml > my-new-pod.yaml                                                       #to extract the pod definition in YAML format to a file using the command

#REPLICASET CMDS

kubectl create -f (nameofreplicafile .yaml)                                                            #to create a replicaset from a YAML file
kubectl get replicaset / rs                                                                            #to get all replicasets
kubectl edit rs (nameofreplicaset)                                                                     #to edit a specific replicaset
kubectl delete replicaset (nameofreplicasetinfile)                                                     #also delete all underlying pods
kubectl replace -f (nameofreplicafile .yaml)                                                           #to replace a replicaset with a new definition from a YAML file
kubectl get rs (nameofreplicaset) -o yaml                                                              #to get the details of a specific replicaset in YAML format
kubectl scale --replicas=(numberofyouwantcreate) -f (nameofreplicafile .yaml)                          #to scale a replicaset to a specific number of replicas using a YAML file
kubectl scale rs (nameofreplica) --replica=(numberofyouwantcreate)                                     #to scale a specific replicaset to a specific number of replicas
kubectl scale --replicas=(numberofyouwantcreate) replicaset (nameofreplicasetinfile)                   #to scale a replicaset to a specific number of replicas
kubectl explain replicaset                                                                             #to get detailed information about the replicaset resource

#DEPLOYMENTS CMDS

kubectl create -f (nameofyourdeploymentfile .yaml)                                                     #to create a deployment from a YAML file
kubectl get deployments                                                                                #to get all deployments
kubectl get deploy (nameofdeployment) -n (namespace)                                                   #to get a specific deployment in a specific namespace  
kubectl get all                                                                                        #to get all resources in the current namespace
kubectl create deployment --help                                                                       #to get help on creating deployments

#SERVICES CMDS

kubectl create -f (nameofyourservicefile .yaml)                                                        #to create a service from a YAML file
kubectl get services                                                                                   #to get all services in the current namespace

#NAMESPACES CMDS

kubectl get namespaces / ns                                                                            #to get all namespaces
kubectl create -f (nameofyournamespace .yaml)  / kubectl create namespace (nameofyournamespace)        #to create a namespace from a YAML file or by name
kubectl config set-context $(kubetcl config current-context) --namespace=(nameofyournamespace)         #this cmd will set the default namespace  but for others we have to mention the ns to get details pf pods, nodes, svc, etc

#Exam tip for imperative approach
#Create Objects  kubectl apply -f nginx.yaml                                                
kubectl run --image=nginx nginx                                                                        #to create a deployment with the nginx image
kubectl create deployment --image=nginx nginx                                                          #to create a deployment with the nginx image
kubectl expose deployment nginx --port 80                                                              #to expose the nginx deployment on port 80

#Update Objects kubectl apply -f nginx.yaml
kubectl edit deployment nginx                                                                          #to edit the nginx deployment in the default editor 
kubectl scale deployment nginx --replicas=5                                                            #to scale the nginx deployment to 5 replicas
kubectl set image deployment nginx nginx=nginx:1.18                                                    #to update the nginx deployment to use a specific image version