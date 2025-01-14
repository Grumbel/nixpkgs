{ lib
, aiohttp
, bidict
, buildPythonPackage
, fetchFromGitHub
, mock
, msgpack
, pytestCheckHook
, python-engineio
, pythonOlder
, requests
, websocket-client
}:

buildPythonPackage rec {
  pname = "python-socketio";
  version = "5.5.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "miguelgrinberg";
    repo = "python-socketio";
    rev = "v${version}";
    sha256 = "sha256-K5rs3UEGN1BvWDDfJE9/dPDLsZ4EGSsEf6PXodvc2Bg=";
  };

  propagatedBuildInputs = [
    aiohttp
    bidict
    python-engineio
    requests
    websocket-client
  ];

  checkInputs = [
    mock
    msgpack
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "socketio"
  ];

  meta = with lib; {
    description = "Python Socket.IO server and client";
    longDescription = ''
      Socket.IO is a lightweight transport protocol that enables real-time
      bidirectional event-based communication between clients and a server.
    '';
    homepage = "https://github.com/miguelgrinberg/python-socketio/";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ mic92 ];
  };
}
