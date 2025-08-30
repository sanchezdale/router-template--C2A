# renovate: datasource=docker depName=ghcr.io/apollographql/apollo-runtime extractVersion=^[^_]+
FROM ghcr.io/apollographql/apollo-runtime:0.0.14_router2.5.0_mcp-server0.7.0

ARG RAILWAY_KEY

ENV APOLLO_MCP_HEADERS__AUTHORIZATION=$RAILWAY_KEY

# The runtime container comes with a set of default values that work well for most use cases.
# Uncomment the line below if you'd like to modify the router configuration.
COPY router.yaml /config/router_config.yaml
# Copy MCP config alongside router config
COPY mcp_config.yaml /config/mcp_config.yaml
# Copy GraphQL operations into the container
COPY operations /config/operations

# For local development without GraphOS:
# Uncomment the line below to use a locally composed supergraph schema
# COPY data/schema.graphql /config/schema.graphql

ENTRYPOINT ["/init"]
