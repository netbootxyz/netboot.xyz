# Google Compute Engine (GCE)

## Using with netboot.xyz

**Experimental, currently doesn't work on any images that utilize memdisk as console output cannot be altered.**

*Note: Functionality will be limited as the console is Serial Over Lan.  Distros that utilize memdisk may not provide output while other distros that are retrieved via kernel allow for altering of the console settings during load.  This includes most of the utility tools.  I'll probably look at filtering out options that don't work in the future.  Console may work during the install but may stop working on first boot if it's not set during the install.*

### Create a Bucket

Set a name for your bucket and select the regional storage class.

Upload the netboot.xyz-gce image from this [link](https://boot.netboot.xyz/ipxe/netboot.xyz-gce.tar.gz) to the root of your bucket.

    gsutil cp $tmp/$image_name.tar.gz gs://$gs_bucket

### Create an image

Using the gcloud utility or the Google Cloud Shell, create an image from the iPXE disk you uploaded in the previous step:

    gcloud compute images create $image_name --source-uri gs://$gs_bucket/$image_name.tar.gz

### Boot an instance

Start an instance from the image you created, make sure to enable the serial-port:

    gcloud compute instances create $instance_name --image $image_name --metadata serial-port-enable=1

### Connect to the Instance over Serial Console

    gcloud beta compute connect-to-serial-port $instance_name

From here you should see the netboot.xyz menu and that's probably all you'll be able to do at this point. :)

### Configuring the Instance

In the event DHCP does not work, you'll need to set the static IP address during install time.  You can view this by going into instance details in the console, and clicking on default under network.  You'll need to set the internal IP of the instance along with the subnet and gateway on that page.

### Notes

Here are some notes on how the iPXE image is created in case you want to play around with vanilla iPXE in GCE.

See the iPXE commit [here](https://github.com/ipxe/ipxe/commit/de85336abb7861e4ea4df2e296eb33d179c7c9bd) for more info of GCE support in iPXE.

To create a usable image for GCE:

    make bin/ipxe.usb CONFIG=cloud EMBED=$tmp/main.ipxe
    cp -f bin/ipxe.usb $tmp/disk.raw
    ( cd $tmp; tar Sczvf $image_name.tar.gz disk.raw )

To get the installers to work to output serial, when the GCE disk is detected, the console on the kernel command line is set to:

    console=ttyS0,115200n8

## Using without netboot.xyz (standard iPXE)

When building your script, you will want it to look something like this:

    #!ipxe

    echo Google Compute Engine - iPXE boot via metadata
    ifstat ||
    dhcp ||
    route ||
    chain -ar http://metadata.google.internal/computeMetadata/v1/instance/attributes/ipxeboot

Then when provisioning your instance, you can specify your custom iPXE script file:

    # Create shared boot image
    make bin/ipxe.usb CONFIG=cloud EMBED=config/cloud/gce.ipxe

    # Configure per-instance boot script
    gcloud compute instances add-metadata <instance> \
           --metadata-from-file ipxeboot=boot.ipxe

This lets your custom compiled iPXE boot and then immediately chain to your
custom iPXE script.
