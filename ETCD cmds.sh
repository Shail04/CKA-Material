#ETCD - Commands (Optional)
#(Optional) Additional information about ETCDCTL Utility
#ETCDCTL is the CLI tool used to interact with ETCD.
#ETCDCTL can interact with ETCD Server using 2 API versions - Version 2 and Version 3.  By default its set to use Version 2. Each version has different sets of commands.
#To use ETCDCTL, you need to have access to the ETCD API Server. In a Kubernetes cluster, the ETCD API Server is typically running on the master node. You can access it using the kubectl exec command to run ETCDCTL commands inside the etcd-master pod.
#To run ETCDCTL commands, you can use the following command format:
kubectl exec etcd-master -n kube-system -- sh -c "etcdctl <command>"                                                                                        

#This command allows you to execute ETCDCTL commands inside the etcd-master pod in the kube-system namespace.
#For example, to get the first 10 keys from the ETCD store, you can use the following command:
kubectl exec etcd-master -n kube-system -- sh -c "etcdctl get / --prefix --keys-only --limit=10"

#For example ETCDCTL version 2 supports the following commands:
etcdctl backup                      #to backup the ETCD data
etcdctl cluster-health          #to check the health of the ETCD cluster
etcdctl mk                #to create a new key in the ETCD store
etcdctl mkdir                       #to create a new directory in the ETCD store
etcdctl ls                         #to list keys in the ETCD store
etcdctl rm                         #to remove a key from the ETCD store
etcdctl rmdir                      #to remove a directory from the ETCD store   
etcdctl set                #to set a value for a key in the ETCD store  


#Whereas the commands are different in version 3
etcdctl snapshot save                       #to save a snapshot of the ETCD data
etcdctl snapshot status                     #to check the status of a snapshot
etcdctl endpoint status                     #to check the status of the ETCD endpoints
etcdctl endpoint status --write-out=table  #to check the status of the ETCD endpoints in a table format
etcdctl endpoint status --write-out=json   #to check the status of the ETCD endpoints in JSON format
etcdctl endpoint status --write-out=yaml   #to check the status of the ETCD endpoints in YAML format
etcdctl endpoint health                     #to check the health of the ETCD endpoints  
etcdctl get                                                         #to get the value of a key in the ETCD store
etcdctl put                        #to set a value for a key in the ETCD store
etcdctl del                        #to delete a key from the ETCD store
etcdctl watch                      #to watch for changes in the ETCD store
etcdctl lease grant                 #to create a new lease in the ETCD store
etcdctl lease revoke                #to revoke a lease in the ETCD store
etcdctl lease keep-alive            #to keep a lease alive in the ETCD store
etcdctl lease time-to-live          #to check the time-to-live of a lease in the ETCD store
etcdctl member list                  #to list the members of the ETCD cluster
etcdctl member add                   #to add a new member to the ETCD cluster
etcdctl member remove                #to remove a member from the ETCD cluster
etcdctl member update                 #to update a member in the ETCD cluster
etcdctl role add                     #to add a new role in the ETCD store
etcdctl role delete                  #to delete a role in the ETCD store
etcdctl role list                    #to list the roles in the ETCD store
etcdctl role grant-permission         #to grant a permission to a role in the ETCD store
etcdctl role revoke-permission        #to revoke a permission from a role in the ETCD store
etcdctl user add                     #to add a new user in the ETCD store
etcdctl user delete                  #to delete a user in the ETCD store
etcdctl user list                    #to list the users in the ETCD store
etcdctl user grant-role                #to grant a role to a user in the ETCD store
etcdctl user revoke-role               #to revoke a role from a user in the ETCD store
etcdctl auth enable                   #to enable authentication in the ETCD store
etcdctl auth disable                  #to disable authentication in the ETCD store
etcdctl auth status                   #to check the status of authentication in the ETCD store
etcdctl defragment                     #to defragment the ETCD store
etcdctl compaction                     #to compact the ETCD store
etcdctl snapshot restore                #to restore a snapshot of the ETCD data
etcdctl snapshot status                 #to check the status of a snapshot
etcdctl member promote                 #to promote a member in the ETCD cluster
etcdctl member demote                  #to demote a member in the ETCD cluster
etcdctl alarm list                    #to list the alarms in the ETCD store
etcdctl alarm disarm                  #to disarm an alarm in the ETCD store
etcdctl alarm disarm --alarm (alarmname)  #to disarm a specific alarm in the ETCD store
etcdctl alarm disarm --alarm (alarmname) --all  #to disarm all alarms in the ETCD store
etcdctl alarm disarm --alarm (alarmname) --all --force  #to forcefully disarm all alarms in the ETCD store
etcdctl alarm disarm --alarm (alarmname) --all --force --timeout=(timeout)  #to forcefully disarm all alarms in the ETCD store with a timeout


#To set the right version of API set the environment variable ETCDCTL_API command
export ETCDCTL_API=3                    #This command sets the ETCDCTL API version to 3, which is required for the commands listed above to work. You can also set this variable in the command itself as shown below:

# To set the ETCDCTL API version to 3 and run a command, you can use the following command format:
kubectl exec etcd-master -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl <command>"              #This command allows you to run ETCDCTL commands with API version 3 inside the etcd-master pod in the kube-system namespace.

# Then you can run the commands as follows:
kubectl exec etcd-master -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl get / --prefix --keys-only --limit=10"   #This command retrieves the first 10 keys from the ETCD store using API version 3.
#Note: The above command will not work if the ETCDCTL API version is not set to 3, as the commands listed above are specific to API version 3.

#When API version is not set, it is assumed to be set to version 2. And version 3 commands listed above don't work. When API version is set to version 3, version 2 commands listed above don't work.

#Apart from that, you must also specify path to certificate files so that ETCDCTL can authenticate to the ETCD API Server. The certificate files are available in the etcd-master at the following path. We discuss more about certificates in the security section of this course. So don't worry if this looks complex:

--cacert /etc/kubernetes/pki/etcd/ca.crt     #This is the CA certificate file used to verify the ETCD server's certificate.
--cert /etc/kubernetes/pki/etcd/server.crt   #This is the client certificate file used to authenticate the ETCD client to the ETCD server.
--key /etc/kubernetes/pki/etcd/server.key   #This is the client key file used to authenticate the ETCD client to the ETCD server.


#So for the commands I showed in the previous video to work you must specify the ETCDCTL API version and path to certificate files. Below is the final form:

kubectl exec etcd-master -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl get / --prefix --keys-only --limit=10 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt  --key /etc/kubernetes/pki/etcd/server.key"  
#This command retrieves the first 10 keys from the ETCD store using API version 3 and the specified certificate files for authentication.