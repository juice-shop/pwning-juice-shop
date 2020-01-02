# Insecure Deserialization

> Serialization is the process of turning some object into a data format
> that can be restored later. People often serialize objects in order to
> save them to storage, or to send as part of communications.
> Deserialization is the reverse of that process -- taking data
> structured from some format, and rebuilding it into an object. Today,
> the most popular data format for serializing data is JSON. Before
> that, it was XML.
>
> However, many programming languages offer a native capability for
> serializing objects. These native formats usually offer more features
> than JSON or XML, including customizability of the serialization
> process. Unfortunately, the features of these native deserialization
> mechanisms can be repurposed for malicious effect when operating on
> untrusted data. Attacks against deserializers have been found to allow
> denial-of-service, access control, and remote code execution
> attacks.[^1]

## Challenges covered in this chapter

| Name               | Description                                                                                        | Difficulty |
|:-------------------|:---------------------------------------------------------------------------------------------------|:-----------|
| Blocked RCE DoS    | Perform a Remote Code Execution that would keep a less hardened application busy forever.          | ⭐⭐⭐⭐⭐   |
| Successful RCE DoS | Perform a Remote Code Execution that occupies the server for a while without using infinite loops. | ⭐⭐⭐⭐⭐⭐  |

ℹ️ _Please note that both RCE challenges described below are **not
available** when running the Juice Shop in either a Docker container or
on a Heroku dyno! The deserialization actually happens in a sandbox with
a timeout, but with sufficient skills an attacker could break out of the
sandbox and actually harm the underlying system. While it is unfortunate
to not have RCE challenges on containerized environments, this
illustrates how hard it is to protect against deserialization attacks
except for not using it at all._

### Perform a Remote Code Execution that would keep a less hardened application busy forever

> Code Injection is the general term for attack types which consist of
> injecting code that is then interpreted/executed by the application.
> This type of attack exploits poor handling of untrusted data. These
> types of attacks are usually made possible due to a lack of proper
> input/output data validation, for example:
>
> * allowed characters (standard regular expressions classes or custom)
> * data format
> * amount of expected data
>
> Code Injection differs from Command Injection in that an attacker is
> only limited by the functionality of the injected language itself. If
> an attacker is able to inject PHP code into an application and have it
> executed, he is only limited by what PHP is capable of. Command
> injection consists of leveraging existing code to execute commands,
> usually within the context of a shell.[^2]
>
> The ability to trigger arbitrary code execution from one machine on
> another (especially via a wide-area network such as the Internet) is
> often referred to as remote code execution.[^3]

* The feature you need to exploit for this challenge is not directly
  advertised anywhere.
* As the Juice Shop is written in pure Javascript, there is one data
  format that is most probably used for serialization.
* You should try to make the server busy for all eternity.
* The challenge will be solved if you manage to trigger the protection
  of the application against a very specific DoS attack vector.
* Similar to the
  [Let the server sleep for some time](injection.md#let-the-server-sleep-for-some-time)
  challenge (which accepted nothing but NoSQL Injection as a solution)
  this challenge will only accept proper RCE as a solution. It cannot be
  solved by simply hammering the server with requests. _That_ would
  probably just _kill_ your server instance.

### Perform a Remote Code Execution that occupies the server for a while without using infinite loops

> An infinite loop (or endless loop) is a sequence of instructions in a
> computer program which loops endlessly, either due to the loop having
> no terminating condition, having one that can never be met, or one
> that causes the loop to start over.[^4]

* This challenge uses the same leverage point as
  [Perform a Remote Code Execution that would keep a less hardened application busy forever](#perform-a-remote-code-execution-that-would-keep-a-less-hardened-application-busy-forever).
* The application has a protection against too many iterations (i.e.
  _infinite loops_) which your attack must not trigger in order to solve
  this challenge.

[^1]: https://www.owasp.org/index.php/Deserialization_Cheat_Sheet
[^2]: https://www.owasp.org/index.php/Code_Injection
[^3]: https://en.wikipedia.org/wiki/Arbitrary_code_execution
[^4]: https://en.wikipedia.org/wiki/Infinite_loop