import rclpy
from rclpy.node import Node

from ackermann_msgs.msg import AckermannDriveStamped


class ExampleNode(Node):

    def __init__(self):
        super().__init__('example_node')
        # topic_name = "/vesc/high_level/input/nav_0"
        # topic_name = "/vesc/high_level/input/nav_1"
        topic_name = "/vesc/high_level/input/nav_2"
        print(topic_name)
        self.publisher_ = self.create_publisher(AckermannDriveStamped, topic_name, 10)
        # self.publisher_ = self.create_publisher(AckermannDriveStamped, '/vesc/high_level/ackermann_cmd_mux/input/nav_0',
        #                                        10)
        # self.publisher_ = self.create_publisher(AckermannDriveStamped, '/vesc/low_level/ackermann_cmd', 10)
        # self.publisher_ = self.create_publisher(AckermannDriveStamped, '/vesc/high_level/input/nav_0', 10)
        self.timer = self.create_timer(0.05, self.timer_callback)

    def timer_callback(self):
        """
        Callback function.
        """
        msg = AckermannDriveStamped()

        # Go in a circle
        msg.header.stamp = self.get_clock().now().to_msg()
        msg.drive.steering_angle = 0.34
        msg.drive.speed = 1.0
        self.get_logger().info("got data!")
        self.publisher_.publish(msg)


def main(args=None):
    rclpy.init(args=args)

    node = ExampleNode()

    rclpy.spin(node)

    rclpy.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
