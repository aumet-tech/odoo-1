# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc
import odoo.addons.aumet.cli.products_pb2 as products__pb2


class ProductStub(object):
    """The greeting service definition.
    """

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.consumeProduct = channel.unary_unary(
                '/products.Product/consumeProduct',
                request_serializer=products__pb2.ProductRequest.SerializeToString,
                response_deserializer=products__pb2.ProductReply.FromString,
                )


class ProductServicer(object):
    """The greeting service definition.
    """

    def consumeProduct(self, request, context):
        """Sends a greeting
        """
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_ProductServicer_to_server(servicer, server):

    rpc_method_handlers = {
            'consumeProduct': grpc.unary_unary_rpc_method_handler(
                    servicer.consumeProduct,
                    request_deserializer=products__pb2.ProductRequest.FromString,
                    response_serializer=products__pb2.ProductReply.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'products.Product', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class Product(object):
    """The greeting service definition.
    """

    @staticmethod
    def consumeProduct(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        import products_pb2 as products__pb2
        return grpc.experimental.unary_unary(request, target, '/products.Product/consumeProduct',
            products__pb2.ProductRequest.SerializeToString,
            products__pb2.ProductReply.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
