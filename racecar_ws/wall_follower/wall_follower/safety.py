import rclpy
from rclpy.node import Node

from ackermann_msgs.msg import AckermannDriveStamped


class ExampleNode(Node):

    def __init__(self):
        super().__init__('safety_node')
        topic_name = "/vesc/low_level/input/safety"
        print(topic_name)
        self.publisher_ = self.create_publisher(AckermannDriveStamped, topic_name, 10)
        self.timer = self.create_timer(1.0, self.timer_callback)

    def timer_callback(self):
        """
        Callback function.
        """
        msg = AckermannDriveStamped()

        # Go in a circle
        msg.header.stamp = self.get_clock().now().to_msg()
        msg.drive.steering_angle = 0.34
        msg.drive.speed = 0.0
        self.publisher_.publish(msg)


def main(args=None):
    rclpy.init(args=args)

    node = ExampleNode()

    rclpy.spin(node)

    rclpy.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
