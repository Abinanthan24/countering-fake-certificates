pragma solidity ^0.8.0;

contract HealthcareCertificate {
  // Define the structure of a healthcare certificate
  struct Certificate {
    uint256 id;
    string fullName;
    string certificateType;
    string issuingAuthority;
    uint256 issueDate;
    uint256 expiryDate;
    string IPFS_Hash;
  }

  // Mapping to store all certificates
  mapping (uint256 => Certificate) public certificates;

  // Counter variable to keep track of the number of certificates
  uint256 public certificateCount = 0;

  // Event to track the creation of certificates
  event CertificateCreated(
    uint256 id,
    string fullName,
    string certificateType,
    string issuingAuthority,
    uint256 issueDate,
    uint256 expiryDate,
    string IPFS_Hash
  );

  // Function to create a new certificate
  function createCertificate(
    string memory _fullName,
    string memory _certificateType,
    string memory _issuingAuthority,
    uint256 _issueDate,
    uint256 _expiryDate,
    string memory _IPFS_Hash
  ) public {
    // Increment the certificateCount variable to generate a unique ID
    certificateCount++;
    uint256 id = certificateCount;
    certificates[id] = Certificate(
      id,
      _fullName,
      _certificateType,
      _issuingAuthority,
      _issueDate,
      _expiryDate,
      _IPFS_Hash
    );
    emit CertificateCreated(
      id,
      _fullName,
      _certificateType,
      _issuingAuthority,
      _issueDate,
      _expiryDate,
      _IPFS_Hash
    );
  }

  // Function to verify the authenticity of a certificate
  function verifyCertificate(uint256 _id) public view returns (bool) {
    Certificate memory certificate = certificates[_id];
    if (certificate.id == _id) {
      return true;
    }
    return false;
  }

  // Function to retrieve a certificate by its id
  function getCertificate(uint256 _id) public view returns (
    uint256,
    string memory,
    string memory,
    string memory,
    uint256,
    uint256,
    string memory
  ) {
    Certificate memory certificate = certificates[_id];
    return (
      certificate.id,
      certificate.fullName,
      certificate.certificateType,
      certificate.issuingAuthority,
      certificate.issueDate,
      certificate.expiryDate,
      certificate.IPFS_Hash
    );
  }
}
