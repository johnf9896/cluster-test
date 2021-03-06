import Config

cluster_strategy = System.get_env("CLUSTER_STRATEGY", "gossip")

topologies =
  case cluster_strategy do
    "gossip" ->
      [
        numbers: [
          strategy: Cluster.Strategy.Gossip
        ]
      ]

    "kubernetes_dns" ->
      [
        one: [
          strategy: Cluster.Strategy.Kubernetes.DNS,
          config: [service: "cluster-nodes-one", application_name: "one"]
        ],
        two: [
          strategy: Cluster.Strategy.Kubernetes.DNS,
          config: [service: "cluster-nodes-two", application_name: "two"]
        ],
        three: [
          strategy: Cluster.Strategy.Kubernetes.DNS,
          config: [service: "cluster-nodes-three", application_name: "three"]
        ]
      ]
  end

config :two, topologies: topologies
