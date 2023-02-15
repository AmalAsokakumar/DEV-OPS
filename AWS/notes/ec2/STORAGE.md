# EC2 storages 
1. EBS - elastic block store




# EBS

`
Amazon EBS Multi-Attach enables you to attach a single Provisioned IOPS SSD (io1 or io2) volume to multiple instances that are in the same Availability Zone. You can attach multiple Multi-Attach enabled volumes to an instance or set of instances. Each instance to which the volume is attached has full read and write permission to the shared volume. Multi-Attach makes it easier for you to achieve higher application availability in clustered Linux applications that manage concurrent write operations.
`

Amazon Elastic Block Store (EBS) is a service provided by Amazon Web Services (AWS) that allows you to create and manage storage volumes for use with Amazon Elastic Compute Cloud (EC2) instances. EBS provides persistent block-level storage for EC2 instances, meaning that the data stored on an EBS volume will persist even after the EC2 instance it is attached to is stopped or terminated.

EBS volumes can be used as the primary storage for an EC2 instance, or as additional storage for an instance. They can also be used as a boot volume, allowing you to launch an EC2 instance with a specific operating system and pre-installed software.

EBS offers a few different types of volumes, each with different performance characteristics:

General Purpose (SSD) Volumes: These are the most commonly used EBS volumes and are suitable for a wide range of workloads. They provide a balance of performance and cost and are backed by solid-state drives (SSDs).
Provisioned IOPS (SSD) Volumes: These volumes provide high IOPS (input/output operations per second) and are suitable for workloads that require high performance and low latency. They are also backed by SSDs.
Throughput Optimized (HDD) Volumes: These volumes provide high throughput and are suitable for workloads that require high sequential I/O access, such as big data workloads and streaming workloads. They are backed by hard disk drives (HDDs).
Cold (HDD) Volumes: These volumes provide the lowest cost storage option and are suitable for infrequently accessed data, such as backups and data archives. They are also backed by HDDs.
EBS volumes can also be encrypted to protect data at rest and in transit, and can be backed up and snapshotted for data recovery.

In summary, Amazon Elastic Block Store (EBS) is a service provided by Amazon Web Services (AWS) that allows you to create and manage storage volumes for use with Amazon Elastic Compute Cloud (EC2) instances. EBS provides persistent block-level storage for EC2 instances, meaning that the data stored on an EBS volume will persist even after the EC2 instance it is attached to is stopped or terminated. EBS offers different types of volumes, each with different performance characteristics: General Purpose (SSD) Volumes, Provisioned IOPS (SSD) Volumes, Throughput Optimized (HDD) Volumes, Cold (HDD) Volumes. EBS volumes can also be encrypted to protect data at rest and in transit, and can be backed up and snapshotted for data recovery












# EBS Properties
EBS volumes have several properties that are important to consider when using them:

-  Size: EBS volumes can range in size from 1 GB to 16 TB. You can increase the size of an EBS volume while it is in use, but you cannot decrease its size.
-  IOPS: IOPS (input/output operations per second) is a measure of the performance of an EBS volume. The number of IOPS you can provision for a volume depends on the volume type. General Purpose (SSD) volumes can provision up to 10,000 IOPS and Provisioned IOPS (SSD) volumes can provision up to 20,000 IOPS.
-  Throughput: Throughput is a measure of the amount of data that can be transferred to and from an EBS volume per second. The maximum throughput that can be achieved depends on the volume type.
-  Snapshots: EBS volumes can be snapshotted, allowing you to create a point-in-time copy of a volume that can be used to create new volumes or restore data.
-  Encryption: EBS volumes can be encrypted to protect data at rest and in transit. EBS supports both server-side encryption and client-side encryption.
-  Availability: EBS volumes are designed to be highly available and durable, but they are not designed to be 100% available all the time. EBS volumes are stored in a specific Availability Zone, and if the Availability Zone becomes unavailable, the EBS volume will also become unavailable.

-  Data durability: EBS volumes are designed to be highly durable, meaning that the data stored on them is unlikely to be lost due to hardware failure. However, EBS volumes are not designed to be completely invulnerable to data loss.

- In summary, EBS volumes have several properties that are important to consider when using them: Size, IOPS, Throughput, Snapshots, Encryption, Availability, Data durability. EBS volumes can range in size from 1 GB to 16 TB, IOPS (input/output operations per second) is a measure of the performance of an EBS volume, Throughput is a measure of the amount of data that can be transferred to and from an EBS volume per second. EBS volumes can be snapshotted, allowing you to create a point-in-time copy of a volume that can be used to create new volumes or restore data. EBS volumes can be encrypted to protect data at rest and in transit. EBS volumes are designed to be highly available and durable, but they are not designed to be 100% available all the time. EBS volumes are stored in a specific Availability Zone, and if the Availability Zone becomes unavailable, the EBS volume will also become unavailable. EBS volumes are designed to be highly durable, meaning that the data stored on them is unlikely to be lost due to hardware failure.













# EBS snapshot 

An Amazon EBS snapshot is a point-in-time copy of an EBS volume that can be used to create new volumes or restore data. EBS snapshots are incremental, meaning that only the blocks that have changed since the last snapshot are saved.

You can create an EBS snapshot by right-clicking on an EBS volume in the AWS Management Console and selecting "Create Snapshot". You can also create a snapshot programmatically using the AWS Command Line Interface (CLI) or the AWS SDKs.

Once a snapshot has been created, it can be used to create a new EBS volume. You can also copy a snapshot to another region for disaster recovery or data migration purposes.

Snapshots can also be used to automate data backup and disaster recovery procedures. You can create a schedule for automated snapshots, which are taken at a specified interval, such as daily, weekly, or monthly. Additionally, EBS snapshots can be used to create an Amazon Machine Image (AMI) which is a pre-configured virtual machine image, saving a lot of time and effort in recreating an environment.

It's important to note that, while EBS snapshots are stored in Amazon S3 and are designed to be highly durable, they are not designed to be completely invulnerable to data loss. It's recommended to have a backup of your snapshot in another region, or even better in another provider.
#

EBS snapshots have several features that are important to consider when using them:

Incremental: EBS snapshots are incremental, meaning that only the blocks that have changed since the last snapshot are saved. This makes it efficient to create and store multiple snapshots of the same volume.

Data Consistency: EBS snapshots are consistent, meaning that the data in the snapshot is in a consistent state, and all the file system data is captured correctly.

Data Compression: EBS snapshots are compressed, which reduces the storage footprint and cost of the snapshots.

Encryption: EBS snapshots can be encrypted to protect data at rest. EBS supports both server-side encryption and client-side encryption.

Versioning: EBS snapshots are versioned, meaning that multiple snapshots of the same volume can be taken and stored.

Copy: You can copy EBS snapshots to another region or to another account for disaster recovery or data migration purposes.

Tagging: EBS snapshots can be tagged, which allows you to organize and categorize your snapshots.

Automation: EBS snapshots can be automated, you can schedule snapshots to be taken at a specified interval, such as daily, weekly, or monthly.

AMI Creation: EBS snapshots can be used to create an Amazon Machine Image (AMI) which is a pre-configured virtual machine image, saving a lot of time and effort in recreating an environment.

In summary, EBS snapshots have several features such as being incremental, having data consistency, data compression, encryption, versioning, ability to be copied, tagging, automation and the ability to create an Amazon Machine Image (AMI). These features make it easy to manage and utilize EBS snapshots for data backup and disaster recovery procedures.


There are two types of snapshots in Amazon EBS:

Standard snapshots: These are the most common type of snapshots. They are created by making a copy of the data on an EBS volume and storing it in Amazon S3. These snapshots can be used to create new EBS volumes or restore data.
Automated snapshots: These are snapshots that are created automatically by Amazon Elastic Block Store (EBS) on a schedule. The schedule can be set by the user, and automated snapshots can be taken daily, weekly, or monthly. Automated snapshots are useful for automating data backup and disaster recovery procedures.
Additionally, there are other types of snapshots that are provided by 3rd party services, such as CloudEndure, which are able to capture the state of the entire machine, including the Operating System, installed applications, and data. This is a more comprehensive approach than an EBS snapshot and is suitable for more specific scenarios where a complete state of the machine is needed.
#

EBS Snapshot Archive: EBS Snapshot Archive is a feature of Amazon S3 that enables customers to store large amounts of data at a lower cost by moving infrequently accessed data to an Amazon S3 Glacier storage class. This feature can be used to store EBS snapshots for long-term retention. Once an EBS snapshot is archived, it can be retrieved from Amazon S3 Glacier when needed.

Recycle Bin for EBS Snapshots: This feature allows customers to retain deleted snapshots for a configurable period of time (up to 90 days) before they are permanently deleted. This can be useful in scenarios where a snapshot is accidentally deleted and needs to be restored.

Fast Snapshot Restore: This feature allows customers to restore an EBS snapshot to a new volume in a matter of seconds, regardless of the size of the snapshot. This feature can be useful in scenarios where data needs to be quickly restored, such as in the case of a disaster recovery event.

It's important to note that all these features are not enabled by default and needs to be set up and configured by the user. Additionally, these features have an extra cost associated with them, which needs to be considered when planning for data backup and disaster recovery.

Amazon Elastic Block Store (EBS) is a block-level storage service for use with Amazon Elastic Compute Cloud (EC2) instances. EBS provides persistent storage for EC2 instances, which means that the data stored on an EBS volume will be retained after the instance is terminated or stopped. EBS volumes can be used as the primary storage for an instance, or they can be used to store additional data such as application logs, backups, and other data that needs to be retained.

AWS provides several different types of EBS volumes, each with different performance characteristics and use cases:

- General Purpose SSD (gp2) : This is the default EBS volume type and is well-suited for a broad range of workloads, including small to medium-sized databases, development and test environments, and boot volumes. They offer a balance of cost and performance and provide 3 IOPS per GB of storage provisioned.

    - General Purpose SSD (gp2) is a type of Amazon Elastic Block Store (EBS) volume offered by AWS.
    - It is the default EBS volume type and is well-suited for a broad range of workloads.
    - GP2 volumes provide a balance of cost and performance.
    - They are suitable for applications that require moderate I/O performance.
    - Use cases include small to medium-sized databases, development and test environments, and boot volumes.
    - GP2 volumes provide 3 IOPS per GB of storage provisioned

- Provisioned IOPS SSD (io1) : This volume type is designed for I/O-intensive workloads, such as large databases and enterprise applications. They can provide up to 20,000 IOPS per volume and are designed for critical, high-performance workloads that require low latency and high throughput.
    - Provisioned IOPS SSD (io1) is a type of Amazon Elastic Block Store (EBS) volume offered by AWS.
    - It is designed for I/O-intensive workloads that require low latency and high throughput.
    - Use cases include large databases and enterprise applications
    - It can support up to 20,000 IOPS and 16 TiB of storage per volume
    - This type of volume is used for mission critical and transactional workloads that require consistent high performance and low latency.
    - You can specify the number of IOPS you want to provision when creating an io1 volume, which allows you to control costs while still achieving the performance your application needs.

- Cold HDD (sc1) : This volume type is designed for infrequently accessed data, such as archival data and backups. They offer a lower cost per GB than gp2 and io1 volumes, but have lower performance and provide 100 IOPS per TB of storage provisioned.

    - Cold HDD (sc1) is a type of Amazon Elastic Block Store (EBS) volume offered by AWS.
    - It is designed for infrequent access workloads where data is stored infrequently and retrieved infrequently and where the lowest storage cost is important.
    - Use cases include infrequently accessed data, such as backups and data archives.
    - It is less expensive than other EBS volume types, but also has lower performance.
    - It can support up to 250 IOPS and 16 TiB of storage per volume.
    - This type of volume is used for infrequently accessed data, such as backups and data archives.
    - It is ideal for workloads that require large amounts of storage and do not need the high performance of other volume types


- Throughput Optimized HDD (st1) : This volume type is designed for big data and data warehousing workloads that require large amounts of throughput. They provide high throughput at a lower cost per GB than gp2 and io1 volumes, but have lower performance and provide 500 IOPS per TB of storage provisioned.


    - Throughput Optimized HDD (st1) is a type of Amazon Elastic Block Store (EBS) volume offered by AWS.
    - It is designed for large, sequential workloads where data is stored sequentially and retrieved sequentially.
    - Use cases include big data and data warehousing workloads.
    - It can support up to 500 IOPS and 16 TiB of storage per volume.
    - This type of volume is used for large, sequential workloads that require low-cost, high-throughput storage.
    - It is ideal for workloads such as streaming big data, data warehousing, and log processing.
    - It is less expensive than other EBS volume types and is optimized for high throughput at a low cost.

- Magnetic (standard): This is an older volume type that is being phased out by Amazon, it's designed for infrequently accessed data and it has the lowest cost per GB among all other types but also lowest performance with 100 IOPS.
You can choose the volume type based on your use case and requirements, for example, if you have a workload that requires high IOPS and low latency, you would choose an io1 volume. If your workload requires large amounts of throughput, you would choose an st1 volume. And if your workload requires low cost storage for infrequently accessed data, you would choose a Cold HDD or Magnetic volume.


















# EFS works with instances on multiple instances 

Amazon Elastic File System (EFS) is a scalable, fully managed file storage service that enables you to store and access files in the Amazon Web Services (AWS) public cloud. It is designed to be used with Amazon Elastic Compute Cloud (EC2) instances and can be accessed using the standard file system protocols, such as NFS and SMB.

- EFS offers the following benefits:

    - Scalability: EFS automatically scales to the size of your storage needs, up to the limits of the file system.

    - High availability: EFS is designed to provide high availability, so you can access your files even if an availability zone or a single EC2 instance goes down.
    - Data durability: EFS stores multiple copies of your data across multiple availability zones in an AWS region, so your data is always available even in the event of a failure.
    - Security: EFS supports encryption at rest and integrates with AWS Key Management Service (KMS) for key management.

- EFS can be used for a variety of use cases such as:
    - Data sharing between multiple EC2 instances.
    - Storing application data such as media files, backups, and log files.
    - Running big data workloads such as Hadoop and Spark.
    - Storing and sharing home directories or other user data.
    - You can mount an EFS file system on an EC2 instance, and access the data stored in the file system using the standard file system protocols. You can also mount an EFS file system on multiple EC2 instances, which allows you to share data across instances
























## EBS (Elastic Block Store) and EFS (Elastic File System) are both storage services provided by AWS, but they are designed for different use cases and have some key differences:

- EBS:

    - EBS is a block level storage service, which means it stores data as fixed-size blocks.

    - EBS is designed for use with EC2 instances and is only accessible from a single EC2 instance at a time.

    - EBS provides low-latency block-level access to data.

    - EBS is best suited for applications that require low-latency access to data and require a consistent IOPS performance.

    - EBS supports various volume types, such as General Purpose SSD (gp2), Provisioned IOPS SSD (io1), Cold HDD (sc1) and Throughput Optimized HDD (st1) which is suitable for different workloads.

- EFS:

    - EFS is a file level storage service, which means it stores data as files and directories.

    - EFS can be accessed simultaneously from multiple EC2 instances.

    - EFS provides a file-level interface, which allows you to access data using standard file system protocols such as NFS and SMB.

    - EFS is best suited for applications that require shared access to data and have a need for data consistency.

    - EFS supports automatic scalability which makes it easy to scale to petabyte-scale and eliminates the need to provision storage capacity.

In summary, EBS is best suited for applications that require low-latency access to block-level storage and require consistent IOPS performance, while EFS is best suited for applications that require shared access to file-level storage and have a need for data consistency.


