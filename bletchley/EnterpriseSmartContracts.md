# Enterprise Smart Contracts
Marley Gray - Microsoft

## Introduction

It has been a little over a year since we announced project “Bletchley” and since that time we have been working directly with our partners and customers trying to figure out what, "exactly" this all means?  Most of us, when encountering blockchain for the first time are either trying to figure out the tech underneath or simply understand the hype.  We usually don’t get it, at first.  It often takes several turns of the intellectual crank for it to soak in and the possibilities and opportunities to become obvious. This is due to the potential disruptive forces that could be unleashed by the implementation of what is actually off the shelf mature technology.  In hindsight, the implementation of these off the shelf technologies seem obvious for solving the crypto-currency use case.  Proof of work, a brilliant innovation in behavioral economics, often distracts attention from what can be an elegant application of technology that has the potential to disrupt all sorts of institutions. Norms and business processes may never be the same.  Nonetheless, as people come to terms with the ramifications and implications of a shared truth database, its impact is facing stark implementation realities like privacy, performance and scalability, regulatory compliance and governance.
   
So, I won’t spend time here rehashing the possibilities of unleashing blockchain or distributed ledgers broadly, but rather focus on the, “What’s next” in the distributed truth revolution. 

Most people agree that the explosion in interest for blockchains began with the release of Ethereum in late July 2015, which more specifically introduced an implementation of Smart Contracts.
  
In this initial implementation, a smart contract was defined, packaged and executed in a single bundle and executed on every node on the blockchain.  There is a good reason for putting the code with the data and executing or proving its results on every single node on the network, public blockchains are trustless.  You have no mechanism or established recourse channel should someone in a transaction you are participating in break the rules. You must be able to clearly see the code, its output and be able to reproduce the same results at any time in the future.  

Other blockchain and distributed ledgers implement Smart Contracts differently, some implementing different languages and virtual machines, some implementing side chains, some using odd logic containers that are replicated separately between nodes or just between the nodes that belong to the counterparties. None of these approaches seems to satisfy.

This brilliant approach to the public trustless model employed by Bitcoin and then Ethereum influences the design of these Smart Contract approaches. But, the design and architecture of “Public Smart Contracts” and is NOT the topic of this paper. 

In private or consortium deployments, there are fundamental differences in terms of trust of participants.  Parties are known, usually government registered institutions.  There are natural disincentives for bad behavior as participants in a contract are typically in a “for profit” enterprise where bad behavior has negative financial implications.  Where bad behavior does occur, since parties are known, there are established legal remedies - whether government imposed or agreed to by a binding off-chain agreement. Enterprises are really operating in two modes – efficiency and transformation.  For efficiency, there is a desire to leverage existing business logic code in established languages. 

Whether for legacy business logic code or for enabling transformation scenarios, Enterprises may also require specialized resources to perform this logic.  For example, virtual machines with faster processors, larger amounts of memory, faster disks, etc.  may be critical to either delivering the workload at a level of speed to meet business requirements. It may not be practical or realistic to require this on every single node or even a subset of them.  Without this separation of concerns the business is then limited by the power of the lowest performing node in the network.Enterprises are also providing feedback that they expect to be using more than one blockchain in their business, often different blockchain types.  They also expect to interact with other enterprises that will also have their own blockchain types.  There is a need to not just for separation of concerns but sharing of the logic code across blockchain types.  The sharing may be a need to use the same logic in different, distinct chain deployments or a need to have this logic bridge multiple chains.  A model where the same logic must be written, tested, and maintained in different chain specific languages is not optimal.
Since the fall of 2015 I have struggled with this nagging feeling knowing that the implementation of “Public Smart Contracts” would come up way short of their promise in the enterprise. This "public" implementation has a fundamental flaw for enterprise adoption.  No, not the infamous “DAO” incident, seen largely as growing pains that strengthened the overall ecosystem, but no separation of concerns.

Please note, that I believe Smart Contracts as they exist today for public Ethereum, and its future roadmap are actually an elegant approach, design and implementation for contracts on a public, trustless blockchain. Even with business logic taken off-chain, you will still want data logic to exist on the blockchain for validation and transaction finality, like the transfer of assets. The Public Ethereum platform is solid and has a great future.  The founding of the Enterprise Ethereum Alliance is also a great step in the right direction. The process of enhancing the public version of a ` distributed trustless truth database` to a `shared, permissioned, semi-trusted, discreetly private truth database.` 

These are steps in the right direction, but do not satisfy the nagging feeling that more needs to be done.  The announcement of “Bletchley” was the first step in laying out what tools we may have to address this nagging feeling without knowing exactly what would solve for it.

Earlier this year Craig Hajduk and I published an <a href="./AnatomyofASmartContract.md">Anatomy of a Smart Contract</a> that documented our thought process for addressing this nagging feeling.  Enterprise Smart Contracts crystalized an approach based on decomposing a contract's parts, isolating what makes it smart, and providing separation of concerns. The Cryptlet framework and platform is an implementation that will allow enterprises to solve all sorts of opportunities and  persistent, nagging and seemingly intractable problems promised by the blockchain revolution. 

## Enterprise Smart Contract Components 

To understand how to implement a new enterprise type contract, we needed to define exactly what was an Enterprise Smart Contract.  And in order to separate our data and our logic we also needed to further decompose the concept into its major components.  

### Components: 

* Schema – the data elements required for the execution and fulfillment of contract obligations between counterparties and the cryptographic proofs needed to maintain the integrity and trust in the contract for the participating counterparties and any regulatory or oversight entities.  
* Logic – contract logic following rules defined in the schema and agreed to by the counterparties and regulatory oversight parties. Cryptographic proofs required for the execution, versioning and integrity of both the code and its results that are persisted to the blockchain as defined in the schema.  
* Counterparties – authenticated identity that can utilize the same cryptographic primitives as blockchains like digital signatures, of participants (people, organizations and things) agreeing to the terms and execution of the contract. Counterparties are represented as personas in the logic of a contract that are assigned identity as the contract goes through its binding process.
* External Sources – contracts that require external interaction, input of data or notification in order to fulfill the execution requirements of the contract. These external sources and conditions for interaction are agreed to by the counterparties and the regulatory oversight entities and must provide cryptographic proofs in order to trust and maintain the integrity these external sources.  
* Ledger – the immutable instance on a distributed ledger (blockchain) based on the schema that is used to record all contract activities and proofs required. This is can be either the public version of a “distributed trustless truth database” or a “shared, permissioned, semi-trusted, discretionarily private, truth database”.  
* Contract Binding - A Enterprise Smart Contract Binding is the composition of these parts creating a unique instance of an Enterprise Smart Contract. It is created when a contract begins negotiation between counterparties and becomes versioned and locked when each counterparty signs the contract. Once signed and locked the Enterprise Smart Contract begins the execution of the terms and conditions that lead to fulfillment.

![<Smart Contract Redefined>](<images/EntSCRedefined.png>)

For anyone who has ever built any system or process that keeps records, either on paper or in Excel, Access, CICS, RDBMS, etc., you have defined schema in the past.  You can think of a simple business schema that has entities like Customers, Inventory and Orders.  The primary function of the business is to receive Orders from Customers and fulfill them with Inventory for delivery.  So, you have a relationship between Order and Customer and Order and Inventory.  This is your schema.

These types of systems are built for a single company so there are no questions asked  like, who’s customer, order or inventory is this?  You just know these things belong to the company that the application serves.  
   
Blockchains introduce multi-company processes that require strong proofs in order to maintain trust, confidence and integrity of the process, and answer these new questions.  Enterprise Smart Contract Schema’s not only needs the Customer, Inventory and Orders defined, but proofs to go along with them.  That way when the schema is actually implemented on the ledger, in a unique instance, it conforms to the trust model for establishing truth on that blockchain.  In essence, your Enterprise Smart Contract schema is your data template that is stamped on the ledger each time the contract negation process begins between counterparties and records all the activities of the contract until its fulfillment.
 
Logic in Enterprise Smart Contracts is separated from the schema or data.  This logic or code, is not stamped or executed on the blockchain itself, but rather exists and runs “off-chain”.  This code is agreed to by the counterparties, is strongly versioned and can be executed in shared infrastructure that provides confidentiality, discrete trust and performance as well as the proofs needed to satisfy all counterparties as to the integrity of the logic’s output.  These proofs are recorded in the schema for a full trusted audit trail. Executing contract logic off-chain allows for a more discrete trust model to be established independent of the underlying blockchain, where intellectual property and privacy can be preserved and be scoped just between the counterparties. 
 
Counterparties essentially map to strong identities.  Enterprise Smart Contracts, by default, require that transactions not be anonymous to satisfy regulations like KYC, etc.  Privacy is enabled through strong identities to address concerns over a shared infrastructure.  However, blockchain identities are usually represented as a public key or address like: 
```
 0x7C3dE4FF75FBed3340a30a08059bEF0584A71ABE 
```
and are only valid for that specific blockchain.  Enterprises have invested huge sums of capital and effort in creating single sign-on solutions, federated identities and interoperability between directories. Enterprise Smart Contracts allow for the integration of blockchain identities into existing identity systems currently employed by enterprise organizations.  Counterparties can be authenticated by the Enterprise Smart Contract Logic via established authentication platforms and participate in blockchain transactions with their identity recorded natively on the blockchain 
```
0x7C3dE4FF75FBed3340a30a08059bEF0584A71ABE
```
and proofs persisted (digital signatures) to the blockchain without having to issue a blockchain “wallet” to every enterprise user and make them responsible for maintaining their private keys. 

External Sources play a vital part in Enterprise Smart Contracts as most scenarios require them to react to events in the real world.  However, because the external sources can drive behavior and provide input that in turn is used to calculate a price, fee or determine if an obligation is met, strong trust in these sources need to be established between counterparties.  In order to obtain that trust the source needs to be well known with a strong identity, provide proofs as to the integrity of the data it is providing and have well-defined rules as to when the interaction can take place.  For example, if an Enterprise Smart Contract calculates and adjusts escrow balances between two counterparties on a daily basis using a particular commodity, equity, interest rate, etc. only if the markets were open that day and when the markets close.  Anyone signing such a contract would want: 
* To know who is providing this input 
* Assurances as to the integrity of the data provided, no tampering, modification or spoofing 
* Data cannot be provided artificially or outside the bounds of the conditions established 
* Strong proof or attestation of this data used in the calculation, and its proof recorded along with the resulting output of the calculation, the actual input value can remain secret if desired. 

These external sources also need to be flexible to allow for counterparties to include publishing these events from their own internal systems or IoT devices to drive Enterprise Smart Contracts.  For example, you may want your ERP system to trigger behavior in a contract providing some data needed to fulfill the obligations in the contract or an IoT device to feed sensor data that may impact the terms of a contract.

All of the above components are essentially combined to form a contract template that is created on the underlying blockchain or distributed ledger.  This instance of the contract template is provided a unique immutable address where the expected schema defined by the contract can be found and truth established. 

When the ledger instance is created an Enterprise Smart Contract Binding is established forming the negotiation and once signed, executing instance contract.  At this point the contract is referenced by its unique Binding Identification.  
 
![<Contract Binding>](<images/entSCRing.png>)

Because this binding is established when the negotiation processes is started, it is malleable, until signed by all counterparties. Once signed, it is versioned by a hash of its composite part identities, and locked until contract completion or a contract change is requested and approved by all required counterparties, at which time, it can be unlocked, modified, re-versioned. The entire version process is recorded in the ledger. 

Enterprise Smart Contracts are independent from any particular blockchain or distributed ledger platform and work against the existing blockchains in the market today.  This design provides separation of concerns for contracts allowing them to be scaled and versioned independently from the blockchain, provide a more discrete trust model between counterparties, enable privacy and reuse of existing identity solutions. 

## Implementing Enterprise Smart Contracts  
Now that we have defined what makes up an Enterprise Smart Contract its time to take a look at how we implement them. It turns out that the cloud is a perfect companion for distributed ledger systems that want to implement Enterprise Smart Contracts.  The database (blockchain) is maintained by all the nodes in the network and distributed across counterparties in private datacenters, public clouds and perhaps a computer in someone’s garage.  The infrastructure and costs required for you to participate in this shared distributed ledger is up to you.  How many nodes you operate and maintain is your choice and you alone bear the cost.  This is one of the core tenants of blockchains, distributing the network strengthens the truth in the database and increases its resiliency.
However, that only addresses the storage, synchronization and maintenance of the truth database itself, not the actual fulfillment of contracts between counterparties. Benefits of Enterprise Smart Contract includes executing the terms and conditions of them “off-chain” allowing for vastly greater performance, scalability, privacy, versioning and an enterprise approachable development environment.  Additionally, a blockchain independent and more discrete trust model can be used scoped to just the counterparts, preserving privacy and protecting intellectual property and having contract data encrypted at rest on the blockchain.  This shared logic execution platform for Enterprise Smart Contracts allows you to define and execute them while sharing the true cost of running them between counterparties.  I call it “splitting the check”.  If two or more people share a contract (dinner) when the bill arrives you simply split the check `x` ways.  Actually, we can be more discerning than that, but you get the picture. 
 
 
![<Peanut Butter and Jelly>](<images/entscpbj.png>)

## Azure – the enabler 
The Microsoft Azure platform provides most of the building blocks needed to deliver the core technical capabilities for implementing Enterprise Smart Contracts.  However, a framework for implementing them in Azure is required.  Last year, when Cryptlets were introduced, focusing on separating the logic from the data was the primary driver. Allowing your code to share the same cryptographic properties and primitives used by blockchains.  However, it is not enough to share the same cryptographic primitives as blockchains, you also need a framework that provides the infrastructure for creating Enterprise Smart Contracts.  This is not something each counterparty in a  network will want to or should do.  A shared framework for building Enterprise Smart Contracts that can provide the difficult bits required like: 
* Just in time secure runtimes for code 
* Distributed injection of secrets into these runtimes that allow for cryptographic functions like digital signatures and encryption to occur 
* Secure creation and persistence of secrets, private keys, etc. 
* Securely integrate enterprise identity to secrets to allow “on-behalf of” transactions 
* Cryptographic proof generation for cipher diversity (ECC, RSA, etc.) and shared infrastructure for expensive operations like Zero Knowledge Proofs, Ring Signatures and Threshold or Homomorphic encryption 
* Abstracted integration into any blockchain or distributed ledger so logic is portable between platforms 
* Provide blockchain to blockchain interoperability, transactions across multiple different blockchain networks, transitions between networks, distributed transaction coordination, etc. 
* Open surface level API for working with underlying blockchains for integration into existing systems or wiring up user interfaces. 
* Common enterprise development environments like .NET and Java (CLR, JVM) and newer functional languages and DSLs. 
* Extensible Data Services plugins to digest and make sense out of blockchain transactions with data lakes, warehouses, BI/Analytics and AI/Machine Learning.
* Support for a diverse set of experiences from traditional web and mobile to emerging interactivity like voice, bots/AI or mixed reality.
* Integrated storage capabilities for hashing of images, documents or other media for recording on the ledger but stored off chain. 
* Enterprise Operations and Management tools 
Enterprise Smart Contracts must provide proofs of secure execution as well as have access to secrets or private keys in order to sign transactions mapped to specific authenticated identities.  This means working securely with lots of private counterparty keys, ensuring that secrets remain confidential and still allow for the costs for executing logic in this tier to be shared. 

![<Framework Building Blocks>](<images/AzureBB.png>)

Using a combination of enabling technologies in the Azure cloud like Key Vault, Azure Active Directory and emerging secure confidential execution environments (enclaves) provide the foundations for this development framework. 

This framework will be the environment where Enterprise Smart Contracts can be constructed to deliver a secure, multi-party, distributed application platform in the cloud to provide a shared infrastructure for organizations participating in a blockchain ecosystem.  Enterprises can begin collaborating to build next generation workflows, trading platforms, supply chains and new types of applications not yet conceived, while allowing the participants to share in the costs for maintaining these applications. 
## Enterprise Smart Contracts Framework 
The framework provides the tools and platform to build Enterprise Smart Contracts while harnessing the enterprise investments in infrastructure and development skills.  It is composed of four major components, each of which have subcomponents, which will be covered in more depth elsewhere. 

![<Cryptlet Framework Components>](<images/cryptletfx.png>) 

* Secrets, Control and Configuration – provides access to secrets stored in Azure Key Vault to specific identities (people, cryptlets, IoT devices, etc.) via Azure Active Directory. Configuration settings for the framework for blockchains, Enterprise Smart Contracts, users, policy, etc.  
* Runtime Environment Services – provides secure execution environments for Cryptlets and abstracts away the underlying authenticated identity to secrets infrastructure and obtaining this secure environment that they run in. This allows for developers the write Cryptlets in the language of their choice focusing on the logic for the Enterprise Smart Contract and not the underlying “infrastructure”. The key services are dynamically creating secure execution environments for Cryptlets to run in, secure access to secrets used and a Proof Engine that can create cryptographic proofs of all sorts for Cryptlets automatically. These runtime services are provided by a Cryptlet Container that is extensible for adding custom message, security and cryptographic capabilities.
* Transaction Builder and Router – provides transliteration and formatting of Cryptlet Messages into blockchain specific formats and routes these transactions to the appropriate blockchain.  
* API – message based API (Amp, etc.) for sending and receiving messages from the framework. Authentication of Identities via Azure Active Directory and Messaging provided by Azure Service Bus and Event Hub. Enterprise Smart Contracts have a strongly typed message API with native support for cryptographic functions like signatures and encryption.

Let’s examine how the Framework works when an Enterprise Smart Contract Binding is activated. 

![<Cryptlet Framework Flow>](<images/cryptletfxdetail.png>) 

* An active binding is detected or on boot all bindings provided for the Runtime to initialized. 
* Cryptlet secrets required defined in the Contract Binding are requested, these are securely retrieved from the Azure Key Vault and placed into a Cryptlet Keychain. 
* The runtime requests an enclave be created for the Cryptlet or Cryptlets defined in the binding.  A binding can specify a logic or Contract Cryptlet and external source(s) or Utility Cryptlet(s). 
* Cryptlet(s) created and their binding information and keychain are provided for them to work with. 
* A user can send a message to interact with the blockchain, update negotiation terms, etc. This message is authenticated and the identity token is embedded in the message.
* The message is routed to the Cryptlet that performs the logic for the message received and creates a message based on the logic output to be persisted to the blockchain. If the user’s keys are required, those keys can be fetched using the identity token within the message and provided for cryptographic operations. The cryptlet has no knowledge of what blockchain it is working against, simply a contract binding and the message types it knows.  It signs/encrypts the message with keys in its keychain and sends it on its way. 
* The signed message is attested by the secure runtime environment (SRE) and sent to the Transaction Builder and Router. This message is optionally sent to Azure Event Hub for integration into external data services.
* The message destination blockchain is determined from it's binding and the message is provided to the appropriate blockchain proxy for the contract message to be transformed into a blockchain specific transaction. 
* This transformed message is routed to the specific blockchain defined in the binding and optionally written to the Azure Event Hub for integration into external data services. 
* The blockchain accepts and processes the transaction and returns a transaction receipt. 
* The receipt is optionally sent to the Azure Event Hub for correlation in external data services
* The receipt is used by the Cryptlet to generate a response message or perform an additional transaction.  Any response message is delivered back through the Service Bus to the end user or calling application.
  
## Additional Enterprise Smart Contract and Cryptlet Capabilities 
A Contract Binding is given a unique identification that is then versioned by hashing the unique identities of its composite parts once all counterparties sign and the binding becomes locked. The contract binding is also extensible, allowing the inclusion of additional meta-data. If one of the composite parts, other than the ledger schema or address, like correcting a bug in the logic, adding a counterparty, etc., needs to be changed, a contract binding can be updated with a new version based on counterparty agreement. Contracts can continue executing while awaiting acceptance of a version change or can pause execution until acceptance is achieved.  This counterparty agreement to modify the contract is another multi-signature Smart Contract that can wrap around the Enterprise Smart Contract driving a workflow that seeks to obtain acceptance by all counterparties.  Once accepted changes to one of the composite parts of a binding unlocks the binding, calculates a new version hash, re-locks the binding representing the new version of the contract moving forward while the Enterprise Smart Contract keeps the same identity.  The multi-signature versioning contract is referenced as a child contract preserving a record of the change. 
Logic defined in Cryptlets perform either Contract specific logic or horizontal logic designed to be reused. Cryptlets can be written in .NET, JVM or native languages with extensible support to ideally allow for a wide variety of languages including those supporting formal verification.   

### Utility Cryptlets
Utility cryptlets work out of the box with legacy Smart Contract implementations, providing blockchain “oracle” services and other integrations.   Utility Cryptlets can be used to provide information and additional computation for Enterprise Smart Contracts in reusable libraries from market data providers, news and weather, etc. These “oracle” cryptlets along with Integration cryptlets for existing enterprise systems and IoT devices can be used in the framework to building next generation distributed applications for both Public and Private blockchain and cloud environments.

### Example Utility Cryptlets:
* Publishing of attested data from external sources
* Publishing attested data from the blockchain to external sources
* Integration point for existing enterprise systems like ERP, CRM, etc.
* Support reactive event models 
* Cross blockchain(s) queries
* Orchestration and Interaction between private/consortium and public networks like Ethereum and Bitcoin.

### Contract Cryptlets
Contract Cryptlets provide the implementation contract logic that executes.  These cryptlets prescribe all business logic be run off-chain, using the underlying blockchain as a database.  Contract Cryptlets represent the significant shift in architecture for blockchain applications targeted at consortium style implementations.  Specifically, a different more discretionary level of trust between counterparties in the code running in Cryptlets.

### Example Contract or Control Cryptlets:
* Entire logic for all types of contracts, financial products: derivatives, bonds, insurance
* Logic for contracts like licenses: government issued business licenses, certifications, etc.
* Logic and control of IoT devices and their integration and automation with blockchains
* Cross blockchain interoperability: asset or token transfer between different networks and platforms, i.e. Hyperledger Fabric to Enterprise Ethereum
* Token or Coin "minter" off chain integration, proofs and advanced coinable behavior
* Personal bot agent for "on behalf of" use cases
* Distributed transaction support between blockchains and other enterprise systems, ledger resource compensation, 2-phase commit, etc. 
* Integration of public network blockchain smart contracts 

The framework provides key functionality delivering on a hyper-scale, secure, multi-party compute platform featuring secure execution environments and multi-party persisted secrets. Dynamic pooling and allocation of secure confidential environments with private injection of secrets and bindings into Cryptlets running in them, creates a cryptographic proof engine that can be used with any distributed ledger to build applications that we cannot imagine at this time.      
## Summary

The Cryptlet Framework is designed to be a middle tier in a 3-tiered Enterprise Smart Contract architecture following many of the same design and development patterns in enterprise architecture today.  Scalable architecture providing separation of concerns, failover, caching, monitoring, management and resource pooling are some of these capabilities.  What is new is the presence of cryptographic primitives, secure execution enclaves and a run time secrets platform that allows for the creation, persistence and hydration of private keys at scale. This allows Cryptlets to create, store and use keys and secrets in a secure execution environment to do all sorts of cryptographic things like digital signatures, ring, threshold, zero knowledge proofs and even homomorphic encryption.  With these capabilities, the Cryptlet Framework greatly enhances the underlying distributed ledger or blockchains. 

Enterprise Smart Contracts demand a secure, confidential, distributed, multi-party application platform for running shared business logic with a multi-party cryptographic proof system that natively integrates with blockchains.  The Cryptlet Framework provides this and will allow the distribution of costs, risk, identity and more.   
 _________________

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
