return {
	s({
		trig = "Deployment",
		desc = "Build a Kubernetes deployment"
	}, fmt([[
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {deploymentName}
spec:
  selector:
    matchLabels:
      app: {name}
  template:
    metadata:
      labels:
        app: {name}
    spec:
      containers:
        - image: {image}
          imagePullPolicy: IfNotPresent
          name: {name}
          ports:
            - containerPort: {port}
              name: {name}
		]], {
		deploymentName = i(1),
		name = rep(1),
		image = i(2),
		port = i(3),
	})
	),
	s({
		trig = "Service",
		desc = "Build a Kubernetes service"
	}, fmt([[
		apiVersion: v1
		kind: Service
		metadata:
		  name: {serviceName}
		spec:
		  selector:
			  app: {name}
		  ports:
			- name: {name}
			  port: 80
			  targetPort: {name}
		]], {
		serviceName = i(1),
		name = rep(1),
	})
	),
	s({
		trig = "Ingress",
		desc = "Build a Kubernetes ingress"
	}, fmt([[
		apiVersion: networking.k8s.io/v1
		kind: Ingress
		metadata:
		  name: {ingressName}
		spec:
		  ingressClassName: nginx
		  rules:
			- host: {name}.hyperserver.dev
			  http:
				paths:
				  - path: /
					pathType: Prefix
					backend:
					  service:
						name: {name}
						port:
						  number: 80
		]], {
		ingressName = i(1),
		name = rep(1),
	})
	),
}
