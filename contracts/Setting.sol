// SPDX-License-Identifier: MIT
pragma solidity ^0.5.17;

import './base/ExternalStorable.sol';
import './interfaces/ISetting.sol';
import './interfaces/storages/ISettingStorage.sol';

contract Setting is ExternalStorable, ISetting {
    bytes32 private constant TRADING_FEE_RATE = 'TradingFeeRate';

    constructor() public {
        setContractName(CONTRACT_SETTING);
    }

    function Storage() private view returns (ISettingStorage) {
        return ISettingStorage(getStorage());
    }

    function getLiquidationFeeRate(bytes32 asset) external view returns (uint256) {
        return Storage().getUint(LIQUIDATION_FEE_RATE, asset);
    }

    function getTradingFeeRate(bytes32 asset) external view returns (uint256) {
        return Storage().getUint(TRADING_FEE_RATE, asset);
    }
}