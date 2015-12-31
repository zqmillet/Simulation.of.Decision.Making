# Simulation
This document is used to introduce the detail of the simulation.

## Contents
* [The Introduction of the Simulation Object](#Introduction)


<h2 id="Introduction">The Introduction of the Simulation Object</h2>

The simulation object is a chemical reactor control system which is shown as following figure.

&#8194;&#8194;<img src="/Figures/Structure.of.Reactor.Control.System.png" alt="Structure of Reactor Control System" />

This control network contains three layers:

* Management Layer,
* Control Layer,
* Physical Layer.

In the management layer, there are three personal computers and a web server. All the network devices connect to the Ethernet, which connects the internet via a security gateway.

In the control layer, there are three sub networks: Industrial Ethernet 1, 2, 3. In the sub network "Industrial Ethernet 1", three are a engineer state, a data server, and four PLCs. The sub network "Industrial Ethernet 1" connects the management layer via a security gateway. The remaining two sub networks are same as the sub network "Industrial Ethernet 1", so in this section, their details will not be introduced.

In the physical layer, there are a distillation column and two reactor. In the distillation column, the material is separated into two semi-product. One semi-product is the input of reactor 1, and is fixed in the product with another material. The other semi-product is transported into the reactor 2, and is fixed in the other product.

The semi-product and semi-product of this chemical reactor control system is shown as follows.

* **s1** is the semi-product which is the output from the top of the distillation column.
* **s2** is the semi-product which is the other outputs from the bottom of the distillation column. 
* **s3** is the product which is the output from the reactor 1.
* **s4** is the product which is the output from the reactor 2.

The processes of this chemical reactor control system are shown as follows.

* **p1** is the distillation, which can seperate the material into two semi-product **s1** and **s2**.
* **p2** is the mixed heating, which can generate the product by heating semi-product **s1** and the other material.
* **p3** is the heating, which can produce the other product by heating the semi-product **s2**.

So, the process model of this chemical reactor control system is shown as following figure.

&#8194;&#8194;<img src="/Figures/Process.Model.of.Reactor.Control.System.png" width = "200" alt="Process Model of Reactor Control System" />


